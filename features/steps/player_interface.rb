require "fools/player/interface"

require "carps/mod"

require "yaml"

Given /^the Player user interface$/ do
   $interface = Player::Interface.new $controller 
end

# What an awful hack
When /^a character sheet is provided for the player$/ do
   $controller.instance_eval <<-END
@sheet = CARPS::Sheet::Character.new(YAML::load <<-NASTY
Name: Basic Drone
Character Points: 0
The Readies: 0
The Old Grey Matter: 0
The Outer Crust: 0 
"Vim & Vigour": 0
Intoxication: 0
Discomfiture: 0
Pounds: 0
Shillings: 0
Pence: 0
Tolerance for Alcohol: 0
Romantic Resistance: 0
Etiquette: 0
Luck: 0
Chances: 0
Conscience: 0
Student of the Turf: no
NASTY
)
END
end

Then /^test all the Player user inputs$/ do
   commands = []
   commands.push [:drink, "-3", "1"]
   commands.push [:resist, "6"]
   commands.push [:sense, "-2", "6"]
   commands.push [:tussle, "1"]
   test_interface $interface, commands
end
