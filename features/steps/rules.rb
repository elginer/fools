require "fools/rules"
require "carps/mod"

require "yaml"

Given /^a hash of the rules$/ do
   $rules = {}
   $rules["drunkenness"] = Rules::Drink.new
   $rules["combat"] = Rules::Combat.new
   $rules["romance"] = Rules::Resist.new
   $rules["sense"] = Rules::Sense.new
end

When /^the rule is (.+)$/ do |rule_name|
   $rule = $rules[rule_name]
end

Given /^a character sheet for an ordinary drone$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Ordinary McOrdin
Character Points: 0
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 0
Vim & Vigour: 0
Intoxication: 0
Discomfiture: 0
Tolerance for Alcohol: 0
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Pounds: 0
Shillings: 0
Pence: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

Given /^a character sheet for a drone with a high tolerance for alcohol$/ do
   $sheet = CARPS::Sheet::Character.new YAML.load <<-END
Name: Tolerance McTolerancy 
Character Points: 0
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 0
Vim & Vigour: 0
Intoxication: 0
Discomfiture: 0
Tolerance for Alcohol: 3
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Pounds: 0
Shillings: 0
Pence: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

Then /^display the character sheet$/ do
   puts $sheet.emit
end

Then /^show the odds for the drunk rule$/ do
   $rule.show_odds $sheet, -4, 4
end

Then /^apply the drunk rule$/ do
   $rule.apply $sheet, -5, 4
end

Then /^show the odds for the combat rule$/ do
   $rule.show_odds $sheet, $other, :fist 
end

Then /^apply the combat rule$/ do
   $rule.apply $sheet, $other, :fist
end

Then /^apply the romance rule$/ do
   $rule.apply $sheet, $lady
end

Then /^show the odds for the romance rule$/ do
   $rule.show_odds $sheet, $lady
end

Then /^apply the sense rule$/ do
   $rule.apply $sheet, $lady, $other
end

Then /^show the odds for the sense rule$/ do
   $rule.show_odds $sheet, $lady, $other
end

Given /^also a character sheet for a fit drone$/ do
   $other = CARPS::Sheet::Character.new YAML.load <<-END
Name: Fitty McFitFit
Character Points: 0
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 0
Vim & Vigour: 2
Intoxication: 0
Discomfiture: 0
Tolerance for Alcohol: 0
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Pounds: 0
Shillings: 0
Pence: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end

Given /^a character sheet for teh hawt wimenz$/ do
   $lady = CARPS::Sheet::Character.new YAML.load <<-END
Name: Hawty McHawtHawt
Character Points: 0
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 5
Vim & Vigour: 0
Intoxication: 0
Discomfiture: 0
Tolerance for Alcohol: 0
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Pounds: 0
Shillings: 0
Pence: 0
Chances: 0
Conscience: 0
Student of the Turf: no
END
end
