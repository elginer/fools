require "fools/player/launch"

Then /^launch the player interface$/ do
   thrd = $process.launch $mailer, "bin/carps_fools -p"
   thrd.join
end

