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

module Fools

   # Fools dice
   module Dice

      # How drunk will you get?
      def drink vim, resistance, quantity, target
         quantity += resistance
         roll = d 10
         roll + (vim + resistance)
         roll - target
         # Inspect result of roll and determine course of action
         roll.is :<=, -7, quantity - 3
         roll.in_range -6..-4, quantity - 2
         roll.in_range -3..-1, quantity - 1
         roll.in_range 1..3, quantity + 1
         roll.in_range 4..6, quantity + 2
         roll.is :>=, 7, quantity + 3
         roll
      end

   end

end
