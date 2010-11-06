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
   
   module Player 

      # An implementation of the Mod class for playing The Fools
      class Mod < CARPS::Player::Mod

         include Fools::Mod

         # Create the controller
         def initialize
            super
            load_verifiers
         end

         # Describe the Fools
         def description
            <<-END
The Fools.  Copyright John Morrice 2010. 

The Fools is distributed for educational purposes: it is 
intended to be used by programmers, as an aid in 
learning how to write mods for CARPS.

The Fools is loosely based on the rules of the Drones RPG:
http://www.granta.demon.co.uk/drones/
Copyright Ian Crowther, Sheila Thomas, Victoria Uren 1995-1996

You should familiarise yourself with the rules before
play, though note the following differences and quriks
present in this CARPS mod:

* Your character points are present on the character
  sheet. These are your total character points, rather
  than the points you have not yet spent available.  
  Hence you should NOT reduce this value when you spend 
  a point.  
  As in the Fools rules, you should expect 
  the Game Master to tell you how many points you have 
  available before the game begins.

* Two additional character attributes are added:
  Intoxication and Discomfiture.
  These attributes are to keep track of the transitory 
  nature of drunkenness and being the subject of A Sound 
  Drubbing, respectively.  
  These values range from 0 to -10.  0 indicates 
  sobreity or perfect health, while -10 represents a 
  highly debilated state.

END
         end

         # See the drinking odds
         def drink drunkenness, target
            see_drink_odds @sheet, drunkenness, target
         end

         # See the chance to resist romance
         def resist crust
            lady = CARPS::Sheet::Character.new({"The Outer Crust" => crust})
            see_resist_odds @sheet, lady
         end

         # See the odds of winning a fight
         def tussle vim
            drone = CARPS::Sheet::Character.new({"Vim & Vigour" => vim})
            # Weapon doesn't matter
            #
            # THIS IS WRONG!
            see_combat_odds @sheet, drone, :stick
         end

         # See the chance of talking sense
         def sense resist, crust
            lady = CARPS::Sheet::Character.new({"The Outer Crust" => crust})
            sap = CARPS::Sheet::Character.new({"Romantic Resistance" => resist})
            see_sense_odds sap, lady, @sheet
         end

      end

   end

end
