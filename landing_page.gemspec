$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "landing_page/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "landing_page"
  s.version     = LandingPage::VERSION
  s.authors     = ["Marc Busqué"]
  s.email       = ["marc@lamarciana.com"]
  s.homepage    = "https://github.com/waiting-for-dev/landing_page"
  s.summary     = "Rails 4 engine for a landing page (email subscription form)"
  s.description = "Minimal, flexible, unobstrusive rails 4 engine for an email subscription form. It collects name, email and locale used. Optional integration with Campaign Monitor. Ready for I18n."
  s.license     = 'GPL3'

  s.files = Dir["{app,config,db,lib}/**/*", "COPYING.txt", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails"
  s.add_dependency "slim-rails"
  s.add_dependency "createsend"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "shoulda-matchers"
end
