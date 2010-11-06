require "carps/util/init"

require "yaml"

# Update the CARPS mod file on a POSIX system
task :register_mod do
   filename = CARPS::root_config + "mods.yaml"
   contents = ""
   contents = File.read filename
   mods = {}
   unless contents.empty?
      mods = YAML::load contents
   end
   mods["fools"] = "carps_fools"
   new_mods = mods.to_yaml
   mod_file = File.open filename, "w"
   mod_file.write new_mods
   mod_file.close
end
