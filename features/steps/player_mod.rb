require "fools/player"

Given /^the Player mod$/ do
   $controller = Player::create_mod
   $controller.mailer = $mailer
end
