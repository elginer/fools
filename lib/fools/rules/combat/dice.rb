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

module Fools

   module Dice

      include CARPS::Dice

      # Engage in combat
      #
      # The first parameter is the attacker's vim
      # The second is the weapon used
      # The third is the defender's vim
      def combat avim, awep, dvim
         at = d 10
         de = d 10
         at + avim
         de + dvim
         at - de
         at * awep
         at
      end

   end

end
