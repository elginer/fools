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
require "fools/sheet"

module Fools

   module Rules

      # Someone has won the combat
      class CombatWin < CARPS::Action

         protected

         # Decrease the discomfiture of the loser
         def lose sh, by
            Sheet::alter sh, "Discomfiture", -by
            Sheet::alter sh, "Vim & Vigour", -by
            Sheet::alter sh, "The Outer Crust", -by
         end

      end

      # The attacker won
      class AttackerWins < CombatWin
      
         def summary
            "The attacker wins."
         end

         protected

         # The attacker has won
         def execute result, attacker, defender, mul
            lose defender, result
         end

      end

      # The defender won
      class DefenderWins < CombatWin

         def summary
            "The defender wins."
         end

         protected

         # The defender has won
         def execute result, attacker, defender, mul
            lose attacker, result * -1
         end

      end

      # No one wins
      class NoOneWins < CARPS::Action

         def summary
            "Stalemate."
         end

         protected

         # Do nothing
         def execute *forget
         end

      end

      # Combat
      class Combat < CARPS::Rule

         include Fools::Dice

         # Add the actions
         def initialize
            super
            add_action :<, 0, DefenderWins
            add_action :>, 0, AttackerWins
            add_action :==, 0, NoOneWins
         end

         protected

         # The combat dice
         def dice attacker, defender, weapon
            avim = attacker["Vim & Vigour"]
            dvim = defender["Vim & Vigour"]
            mul = 1.0 / 3
            case weapon
            when :handbag
               mul = 1.0 / 5
            when :fist
               mul = 1.0 / 3
            when :stick
               mul = 1.0 / 2
            when :crowbar
               mul = 1.0
            when :knife
               mul = 3.0 / 2
            when :sabre
               mul = 2.0
            when :gun
               mul = 5.0
            end
            combat avim, mul, dvim
         end

      end

   end

end

