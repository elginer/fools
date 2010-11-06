require "fools/player/launch"

Then /^launch the player interface$/ do
   CARPS::Process.singleton.launch $mailer, "bin/carps_fools -p"
end

