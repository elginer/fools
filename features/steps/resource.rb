require "carps/mod/dm/resource"

Given /^a resource manager$/ do
   $resource = CARPS::Resource.new "fools/#{$campaign}"
end
