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
require "fools/rules/drink/dice"

require "fools/sheet"

module Fools

   module Rules

      # A drinking action
      class DrinkAction < CARPS::Action

         protected

         # Make the person drunk
         def execute result, sh, *params
            pending = sh["Intoxication"] + result
            if pending < -9
               pending = -9
            elsif pending > 0
               pending = 0
            end
            sh["Intoxication"] = pending
            if result < 0
               Sheet::alter sh, "Vim & Vigour", result
               Sheet::alter sh, "The Outer Crust", result
            end
         end

      end

      # You are cold sober, ie no change from before.
      class ColdSober < DrinkAction

         def summary
            "Cold sober"
         end

      end

      # You have drunk enough to be happy
      class Happy < DrinkAction

         def summary
            "Become happy."
         end

      end

      # You are tipsy
      class Tipsy < DrinkAction

         def summary
            "A little tipsy"
         end

      end

      # You are DRUNK
      class Drunk < DrinkAction

         def summary
            "Enough to get drunk."
         end

      end

      # VERY DRUNK
      class VeryDrunk < DrinkAction

         def summary
            "VERY DRUNK."
         end

      end

      # Paralytic
      class Paralytic < DrinkAction

         def summary
            "Paralytic."
         end

      end

      # Rule which performs drinking
      class Drink < CARPS::Rule

         include Fools::Dice

         # Add the actions
         def initialize
            super
            add_action :>=, 0, ColdSober
            add_action :==, -1, Happy
            add_action (-3..-2), Tipsy
            add_action (-5..-4), Drunk
            add_action (-8..-6), VeryDrunk
            add_action :<=, -9, Paralytic
         end

         protected

         # Drinking dice
         def dice sheet, quantity, target
            vim = sheet["Vim & Vigour"] 
            resistance = sheet["Tolerance for Alcohol"]
            drink vim, resistance, quantity, target
         end

      end
   end
end
