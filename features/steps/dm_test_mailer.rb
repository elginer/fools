class DMTestMailer

   def relay to, message
      puts "Sending to #{to}: #{message}"
   end

   def save mod
      puts "Saving:"
      puts mod.to_s
   end

   def check type, from = nil
      puts "Checking mail for #{type} from #{from}"
   end

   def load
   end

end

Given /^a DM test mailer$/ do
   $mailer = DMTestMailer.new
end
