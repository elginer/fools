require "fools/rules"

Given /^the DM mod for campaign (.+)$/ do |campaign|
   $controller = DM::create_mod campaign
   $controller.mailer = $mailer
end
