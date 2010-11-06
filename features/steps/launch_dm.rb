require "fools/dm/launch"

require "drb"

Given /^a campaign called (.+)$/ do |name|
   $campaign = name
end

Then /^launch the DM interface$/ do
   CARPS::Process.singleton.launch $mailer, "bin/carps_fools -h #{$campaign}"
end

