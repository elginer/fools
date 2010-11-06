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

require "fools/interface"

module Fools

   module Player
      
      # Interface for Fools Player
      class Interface < CARPS::Player::Interface
        
         # Create the interface
         def initialize mod
            super
            add_command :drink, "See the odds on how drunk you might get.", "DRUNKENNESS", "TARGET"
            add_command :resist, "See your chance to resist romance, given a lady with given The Outer CRUST.", "CRUST"
            add_command :sense, "See your chance to talk sense into a man with Romantic RESISTANCE, who is smitten by a lady with The Outer CRUST.", "RESISTANCE", "CRUST"
            add_command :tussle, "See your chance to overpower a drone with given VIM & Vigour", "VIM"
         end

         protected

         def drink drunkenness, target
            drunkenness = drunkenness.to_i
            target = target.to_i
            @mod.drink drunkenness, target
         end

         def resist crust
            crust = crust.to_i
            @mod.resist crust
         end

         def sense resist, crust
            resist = resist.to_i
            crust = crust.to_i
            @mod.sense resist, crust
         end

         def tussle vim
            vim = vim.to_i
            @mod.tussle vim
         end

      end

   end

end
