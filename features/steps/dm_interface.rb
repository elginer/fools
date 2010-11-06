require "fools/dm/interface"

Given /^the DM user interface$/ do
   $interface = DM::Interface.new $controller 
end

Then /^test all the DM user inputs$/ do
   commands = []
   commands.push [:spawn, "drone", "todd"]
   commands.push [:spawn, "drone", "bob"]
   commands.push [:spawn, "hawt", "mandy"]
   commands.push [:drink, "bob", "-4", "1"]
   commands.push [:drink_odds, "bob", "-5", "1"]
   commands.push [:resist, "todd", "mandy"]
   commands.push [:resist_odds, "todd", "mandy"]
   commands.push [:sense, "bob", "mandy", "todd"]
   commands.push [:sense_odds, "bob", "mandy", "todd"]
   commands.push [:tussle_odds, "bob", "todd"]
   commands.push [:tussle, "bob", "todd", "sabre"]
   test_interface $interface, commands
end
