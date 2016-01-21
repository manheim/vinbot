# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vinbot/version'

Gem::Specification.new do |spec|
  spec.name          = "vinbot"
  spec.version       = Vinbot::VERSION
  spec.authors       = ["Jarod Adair, Umair Chagani"]
  spec.email         = ["jarod.adair@manheim.com, umair.chagani@manheim.com"]

  spec.summary       = %q{Vinbot generates decodeable vins and provides a vehicle object that includes real vehicle data.}
  spec.description   = %q{Vinbot generates decodeable vins and provides a vehicle object that includes real vehicle data.}
  spec.homepage      = "https://github.com/manheim/vinbot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
  spec.add_runtime_dependency "sqlite3"
  spec.add_runtime_dependency "sequel"
  spec.add_runtime_dependency "vin_bank", ">= 3.0.0"
end
