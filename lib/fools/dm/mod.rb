# This file is part of The Fools.

# The Fools is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# The Fools is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with The Fools.  If not, see <http://www.gnu.org/licenses/>.

require "fools/mod"
require "fools/rules"

module Fools

   module DM

      # An implementation of the Mod class for DMing The Fools
      class Mod < CARPS::DM::Mod

         include Fools::Mod 

         # Create the controller
         def initialize resource
            super
            load_verifiers
         end

         # Apply the sense rule
         def sense sap, lady, friend
            with_entities sap, lady, friend do |sap_sheet, lady_sheet, friend_sheet|
               apply_sense sap_sheet, lady_sheet, friend_sheet
            end
         end

         # See the odds on talking sense
         def sense_odds sap, lady, friend
            with_entities sap, lady, friend do |sap_sheet, lady_sheet, friend_sheet| 
               see_sense_odds sap_sheet, lady_sheet, friend_sheet
            end
         end

         # Apply the drinking rule
         def drink entity, quantity, target
            with_entity entity do |drone|
               apply_drink drone, quantity, target
            end
         end

         # See the drink odds
         def drink_odds entity, quantity, target
            with_entity entity do |drone|
               see_drink_odds drone, quantity, target
            end
         end

         # Apply the romantic resistance rule
         def resist person, lady
            with_entities person, lady do |drone, lady_sheet|
               apply_resist drone, lady_sheet
            end
         end

         # See the odds on romantic resistance
         def resist_odds person, lady
            with_entities person, lady do |drone, lady_sheet|
               see_resist_odds drone, lady_sheet
            end
         end

         # One Drone engages another in combat
         def tussle attacker, defender, weapon
            with_entities attacker, defender do |attacker_sheet, defender_sheet|
               apply_combat attacker_sheet, defender_sheet, weapon
            end
         end

         # See the odds of combat
         def tussle_odds attacker, defender, weapon
            with_entities attacker, defender do |attacker_sheet, defender_sheet|
               see_combat_odds attacker_sheet, defender_sheet, weapon
            end
         end

         private

         # Apply the sense rule
         def apply_sense sap, lady, friend
            rule = Rules::Sense.new
            rule.apply sap, lady, friend
         end

         # Apply combat rule
         def apply_combat attacker, defender, weapon
            rule = Rules::Combat.new
            rule.apply attacker, defender, weapon
         end

         # Apply the romantic resistance rule
         def apply_resist drone, lady
            rule = Rules::Resist.new
            rule.apply drone, lady
         end

         # Apply the drink rule
         def apply_drink sheet, quantity, target
            rule = Rules::Drink.new
            rule.apply sheet, quantity, target
         end

      end

   end

end
