require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/fools'

Hoe.plugin :newgem
# Hoe.plugin :website
Hoe.plugin :cucumberfeatures

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'fools' do
  self.developer 'John Morrice', 'spoon@killersmurf.com'
  self.post_install_message = 'PostInstall.txt'
  self.summary              = 'The Fools for CARPS'
  self.description          = "The Fools, copyright Ian Crowther, Sheila Thomas, Victoria Uren 1995-1996.\nsee http://www.granta.demon.co.uk/fools/\nThis is an implementation of The Fools for CARPS."
  self.rubyforge_name       = self.name 
  self.extra_deps         = [['carps','>= 0.2.0']]

end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
