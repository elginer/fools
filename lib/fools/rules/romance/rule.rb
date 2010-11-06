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

   module Rules

      # Resisted being attracted to a young lady
      class ResistedRomance < CARPS::Action

         def summary
            "Kept cool."
         end

         protected

         # Nothing actually happens.  They just roleplay this.
         #
         # TODO: extend character sheet?
         def execute *params
         end

      end

      # Besotted
      class Smitten < CARPS::Action

         def summary
            "Became a poor, besotted drooling sort of fellow."
         end

         protected

         # No change
         def execute *forget
         end

      end

      # Rule which performs romantic resistance
      class Resist < CARPS::Rule

         include Fools::Dice

         # Add the actions
         def initialize
            super
            add_action :>=, 0, ResistedRomance
            add_action :<, 0, Smitten
         end

         protected

         # Resistance dice
         #
         # The first is the sheet of the 'victim'
         #
         # The second of the young lady in question
         def dice drone, lady
            resist = drone["Romantic Resistance"]
            crust = lady["The Outer Crust"]
            resist_romance resist, crust
         end

      end

      # Class for successfully talking a man out of a relationship
      class SensePrevails < CARPS::Action

         def summary
            "Sense pravails.  The sap is de-sopped."
         end

         protected

         # Nothing really happens.  Roleplayed.
         def execute *forget
         end

      end

      # Class for failing to talk a man out of a relationship
      class SenseUseless < CARPS::Action

         def summary
            "Logic has no effect."
         end

         protected

         # Nothing happens
         def execute *forget
         end

      end

      # A rule which handles talking sense into a soppy fool
      class Sense < CARPS::Rule

         include Fools::Dice

         # Add the actions
         def initialize
            super
            add_action :>=, 0, SensePrevails
            add_action :<, 0, SenseUseless
         end

         protected

         # Sense talking dice
         #
         # The first is the sheet of the 'victim'
         #
         # The second of the young lady in question
         #
         # The third of the first's sensible friend
         def dice sap, lady, friend
            resistance = sap["Romantic Resistance"]
            crust = lady["The Outer Crust"]
            matter = friend["The Old Grey Matter"]
            talk_sense resistance, crust, matter
         end

      end

   end

end
