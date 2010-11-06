require "drb"

class PlayerTestMailer

   include DRbUndumped

   def relay message
      puts "Sending #{message}"
   end

   def save mod
      puts "Saving:"
      puts mod.to_s
   end

   def check type
      puts "Checking mail for #{type}"
   end

   def load
   end

end

Given /^a test player mailer$/ do
   $mailer = PlayerTestMailer.new
end
