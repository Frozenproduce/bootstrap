$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootstrap"
  s.version     = Bootstrap::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Bootstrap."
  s.description = "TODO: Description of Bootstrap."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "devise"
  s.add_dependency "devise_invitable"
  s.add_dependency "cancan"
  s.add_dependency "rolify"
  s.add_dependency "twitter-bootstrap-rails"
  s.add_dependency "simple_form"
  s.add_dependency "inherited_resources"
  s.add_dependency "simple-navigation"
  s.add_dependency "state_machine"
  s.add_dependency "builder"
  s.add_dependency "jquery-rails"

end
