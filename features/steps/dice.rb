require "fools/rules"

include Fools::Dice

Given /^a hash of the dice rolls$/ do
   $rolls = {}
   $rolls["drunkenness"] = lambda {drink 0, 1, -4, 4}
   $rolls["combat"] = lambda {combat 1, 1.0/3.0, 3}
   $rolls["sense"] = lambda {talk_sense 0, 1, 0}
   $rolls["romance"] = lambda {resist_romance 1, 5}
end

Given /^a roll is made for (.+)$/ do |roll_name|
   $dice = $rolls[roll_name].call
end

Then /^show the odds$/ do
   puts $dice.odds
end
