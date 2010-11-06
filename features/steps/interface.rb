Then /^present the interface to the user$/ do
   $interface.run
end

# Test an interface by calling the commands
def test_interface interface, commands
   commands.each do |cmd|
      interface.send *cmd
   end
end
