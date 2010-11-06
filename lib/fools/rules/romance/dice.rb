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

   module Dice

      # Resist romance
      #
      # resistance is the Romantic Resistance of the 'victim'.
      #
      # crust is The Outer Crust of the possible object of love
      #
      # Positive on success, negative on failure.  Magnitude is
      # meaningful.
      def resist_romance resistance, crust
         resisted = d 10
         resisted + (resistance - crust)
         resisted
      end

      # Talk sense
      #
      # Can you talk someone out of their love?
      #
      # resistance is the Romantic Resistance of the 'victim'.
      #
      # crust is The Outer Crust of the object of love
      #
      # matter is The Old Grey Matter of the lovestruck drone's sensible friend
      #
      # Positive on success, negative on failure.  Magnitude is
      # meaningful.
      def talk_sense resistance, crust, matter
         convince = d 10
         convince + matter
         # Resist the advice...
         resist = d 10
         resist + (crust - resistance)
         convince - resist
         convince
      end

   end

end
