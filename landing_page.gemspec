$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "landing_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "landing_page"
  s.version     = LandingPage::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of LandingPage."
  s.description = "TODO: Description of LandingPage."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "slim-rails", "~> 1.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~>2.14"
  s.add_development_dependency "capybara", "~>2.1"
  s.add_development_dependency "factory_girl_rails", "~>4.2", ">=4.2.1"
  s.add_development_dependency "shoulda-matchers", "~>2.2"
end
