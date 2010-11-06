require "find"

# Do something with the files
def with_files
   Find.find "." do |path|
      base = File.basename path
      if FileTest.file?(path) and not base[0] == "."
         yield path
      end
   end
end

with_files do |path|
   contents = File.read path
   contents.gsub! /drones/, "fools"
   contents.gsub! /Drones/, "Fools"
   file = File.open path, "w"
   file.write contents
   file.close
end

