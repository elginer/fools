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

require "fools/rules"

require "fools/sheet"

module Fools

   # Generic mod, base of Player and DM mods.
   module Mod 

      # Load in the rules
      include Rules

      protected

      # Load up the semantics and the schema
      def load_verifiers
         @semantics = Sheet::Semantics.new
         @schema = Sheet::schema
      end

      # Fools schema
      def schema
         @schema
      end

      # Semantic verifier for Fools sheets
      def semantic_verifier
         @semantics
      end

      # See drink odds
      def see_drink_odds sheet, quantity, target
         rule = Rules::Drink.new
         rule.show_odds sheet, quantity, target
      end

      # See the odds of resisting
      def see_resist_odds drone, lady
         rule = Rules::Resist.new
         rule.show_odds drone, lady
      end

      # Find the combat odds
      def see_combat_odds attacker, defender, weapon
         rule = Rules::Combat.new
         rule.show_odds attacker, defender, weapon
      end

      # See the sense odds
      def see_sense_odds sap, lady, friend
         rule = Rules::Sense.new
         rule.show_odds sap, lady, friend
      end

   end

end
