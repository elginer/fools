require "fools/sheet"

require "carps/mod"

require "yaml"

Given /^the Fools' verifier$/ do
   $verifier = CARPS::Sheet::Editor.new Sheet::schema, Sheet::Semantics.new
end

When /^a valid sheet is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Sir Bigglesly
Character Points: 37
The Readies: 6
The Old Grey Matter: 1
The Outer Crust: 5
Vim & Vigour: -2
Romantic Resistance: 2
Tolerance for Alcohol: 2
Pounds: 0
Shillings: 0
Pence: 0
Intoxication: 0
Discomfiture: 0
Luck: 0
Chances: 0
Etiquette: 1
Conscience: 0 
Sports Car: flashy 
Student of the Turf: no 
Connections: Gentry
Gentleman's Gentleman: superior
END
end

When /^a syntactically invalid sheet is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Mr Invalid
Character Points: 8
The Readies: 0
The Old Grey Matter: Not much!
The Outer Crust:
Vim & Vigour: 0
END
end

When /^an out of bounds sheet is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Mr Odd
Character Points: 8
The Readies: 11
The Old Grey Matter: 0
The Outer Crust: 0
Pounds: 0
Shillings: -1
Pence: 0
Vim & Vigour: 0
Luck: 0
Intoxication: 0
Discomfiture: 0
Romantic Resistance: 0
Tolerance for Alcohol: 0
Etiquette: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

When /^a character sheet using more than 8 character points is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Mr Greedy
Character Points: 8
The Readies: 2
The Old Grey Matter: 0
The Outer Crust: 0
Vim & Vigour: 2
Intoxication: 0
Discomfiture: 0
Pounds: 0
Shillings: 0
Pence: 0
Romantic Resistance: 0
Tolerance for Alcohol: 2
Luck: 2
Etiquette: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

When /^a character sheet using less than 8 character points is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Mr Needy
Character Points: 8
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 0
Vim & Vigour: 2
Intoxication: 0
Discomfiture: 0
Luck: 0
Chances: 0
Conscience: 0
Pounds: 0
Shillings: 0
Pence: 0
Romantic Resistance: 0
Tolerance for Alcohol: 0
Student of the Turf: no
Etiquette: 0
END
end

When /^a character sheet using exactly 8 character points is provided$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Mr Balanced
Character Points: 8
The Readies: 1
The Old Grey Matter: 3
The Outer Crust: -1
Vim & Vigour: 1
Intoxication: 0
Discomfiture: 0
Pounds: 0
Shillings: 0
Pence: 0
Tolerance for Alcohol: 1
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

Then /^do not accept the character sheet$/ do
   valid = $verifier.valid? $sheet
   if valid
      raise StandardError, "Passed invalid sheet"
   end
end

Then /^accept the character sheet$/ do
   valid = $verifier.valid? $sheet
   unless valid
      raise StandardError, "Failed valid sheet."
   end
end
