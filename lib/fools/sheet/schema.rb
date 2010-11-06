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

require "yaml"

module Fools

   module Sheet

      # Character sheet schema for The Fools
      def Sheet::schema
         CARPS::Sheet::Schema.new YAML.load <<-END
Name: Text
Biography: Optional Text
Character Points: Integer
The Readies: Integer
The Old Grey Matter: Integer
The Outer Crust: Integer
Vim & Vigour: Integer
Luck: Integer
Chances: Integer
Romantic Resistance: Integer
Tolerance for Alcohol: Integer
Conscience: Integer
Etiquette: Integer
Pounds: Integer
Shillings: Integer
Pence: Integer
Intoxication: Integer
Discomfiture: Integer
Student of the Turf: Boolean
Gentleman's Gentleman: Optional Choice Good Superior
Sports Car: Optional Choice Basic Flashy
Specialist Interest: Optional Text
Connections: Optional Text
Difficult Relation: Optional Text
Good Sportsman: Optional Text
END
      end

   end

end
