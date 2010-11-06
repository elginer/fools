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

   module Sheet

      # Safely alter an attribute in a character sheet
      #
      # This is safe as long as the stat's minimum value is -10, and maximum is 10 (see Sheet::Semantics)
      def Sheet::alter sheet, attr, by
         curr = sheet[attr]
         result = curr + by
         if result >= -10 and result <= 10
            sheet[attr] = result
         end
      end

   end
   
end
