require "carps/util/init"

include Fools

Given /^carps is initialized with (.+)$/ do |config|
   CARPS::init 0, config
end
