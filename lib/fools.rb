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

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "carps"

require "fools/interface"
require "fools/mod"
require "fools/util"
require "fools/player"
require "fools/dm"
require "fools/rules"
require "fools/sheet"

module Fools
  VERSION = '0.0.4'
end
