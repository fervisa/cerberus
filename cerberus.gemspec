$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cerberus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cerberus"
  s.version     = Cerberus::VERSION
  s.authors     = ["Fernando Villalobos"]
  s.email       = ["fernando.visa@gmail.com"]
  s.homepage    = "http://logicalbricks.com"
  s.summary     = "Authenicate users."
  s.description = "Small engine to authenicate users using has_secure_password."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.1"
  s.add_dependency "bcrypt", "~> 3.1.11"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails-controller-testing"
end
