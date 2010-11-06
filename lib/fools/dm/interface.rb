# Copyright 2010 John Morrice
 
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

require "carps/mod"

require "fools/interface"

module Fools

   module DM
      
      # Interface for Fools DM
      class Interface < CARPS::DM::Interface
        
         include Fools::Interface

         # Create the interface
         def initialize controller
            super
            add_command :drink, "Apply drink to a DRONE.", "DRONE", "DRUNKENNESS", "TARGET"
            add_command :drink_odds, "See the odds on how drunk a DRONE might get.", "DRONE", "DRUNKENNESS", "TARGET"
            add_command :resist, "Check a DRONE's romantic resistance to the LADY.", "DRONE", "LADY"
            add_command :resist_odds, "See the odds on whether or not an entity will resist romance.", "DRONE", "LADY"
            add_command :sense, "A FRIEND of a SAP tried to talk him out of his love for a LADY.", "SAP", "LADY", "FRIEND"
            add_command :sense_odds, "See the odds on whether talking sense will succeed.", "SAP", "LADY", "FRIEND"
            add_command :tussle, "An ATTACKER attempts to overpower the DEFENDER with a WEAPON.\n#{combat_options}", "ATTACKER", "DEFENDER", "WEAPON"
            add_command :tussle_odds, "See the odds on a fight when the ATTACKER assaults the DEFENDER.", "ATTACKER", "DEFENDER"
         end

         protected

         # Apply the drinking rule
         def drink entity, quantity, target
            quantity = quantity.to_i
            target = target.to_i
            @mod.drink entity, quantity, target
         end

         # See the odds on the drinking rule
         def drink_odds entity, quantity, target
            quantity = quantity.to_i
            target = target.to_i
            @mod.drink_odds entity, quantity, target
         end

         # Apply the romantic resistance rule
         def resist drone, lady
            @mod.resist drone, lady
         end

         # See the odds on the romantic resistance rule
         def resist_odds drone, lady
            @mod.resist_odds drone, lady
         end

         # Apply the talking sense rule
         def sense sap, lady, friend
            @mod.sense sap, lady, friend
         end

         # See the odds on talking sense
         def sense_odds sap, lady, friend
            @mod.sense_odds sap, lady, friend
         end

         # Apply the combat rule
         def tussle attacker, defender, weapon
            weapon = weapon.to_sym
            @mod.tussle attacker, defender, weapon
         end

         # See the odds on the combat rule
         def tussle_odds attacker, defender
            # The weapon is not used for this computation.
            # THIS IS NOT RIGHT 
            @mod.tussle_odds attacker, defender, :stick
         end

      end

   end

end
