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

require "carps/ui"

require "carps/mod/sheet/verifier"

module Fools

   module Sheet

      # Semantic verifier for Fools character sheets
      class Semantics < CARPS::Sheet::UserVerifier

         # Verify a sheet, produce errors if they occur 
         def produce_errors sheet

            errors = []
            lims = field_limits
            # Verify all values are within bounds
            lims.each do |key, valid|
               attr = sheet[key]
               if attr
                  if not valid.include? attr
                     errors.push "Damnit man, #{key} must be between #{valid.min} and #{valid.max}!"
                  end
               end
            end

            # Verify that no more than the limited number of character points has been spent
            total = 0
            advts = [
               "The Readies",
               "The Old Grey Matter",
               "The Outer Crust",
               "Vim & Vigour",
               "Tolerance for Alcohol",
               "Luck",
               "Conscience"
            ]
            advts.each do |key|
               val = sheet[key]
               if val
                  gain = cost(val.abs)
                  if val < 0
                     gain = -gain
                  end
                  total += gain
               end
            end

            car = sheet["Sports Car"]
            if car == "Basic"
               total += 1
            elsif car == "Flashy"
               total += 3
            end

            valet = sheet["Gentleman's Gentleman"]
            if valet == "Good"
               total += 1
            elsif valet == "Superior"
               total += 3
            end

            limit = sheet["Character Points"]
            if total > limit
               errors.push "Don't you know that you used #{total} character points, yet you only had #{limit}?"
            elsif total < limit
               CARPS::UI::highlight "Chin up old bean, you still have #{limit - total} points to spend."
            end
            if errors.empty?
               nil
            else
               errors
            end
         end

         private

         # Points cost per level
         #
         # (Triangular number n)
         def cost n
            (n ** 2 + n) / 2
         end

         # Hard limits on each schema field
         def field_limits
            {
            "The Readies" => -10..10,
            "The Old Grey Matter" => -10..10,
            "The Outer Crust" => -10..10,
            "Vim & Vigour" => -10..10,
            "Romantic Resistance" => -3..3,
            "Tolerance for Alcohol" => -3..3,
            "Luck" => -10..10,
            "Chances" => -30..30,
            "Etiquette" => -1..1,
            "Conscience" => -1..1,
            "Intoxication" => -9..0,
            "Discomfiture" => -9..0,
            # The upper limits here are somewhat arbitrary
            "Pounds" => 0..1000000,
            "Shillings" => 0..10000,
            "Pence" => 0..10000

            }
         end

      end

   end

end
