$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin/awesome_nested_set/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_admin-awesome_nested_set"
  s.version     = ActiveAdmin::AwesomeNestedSet::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/active_admin-awesome_nested_set"
  s.summary     = "Provides sortable_columns helper in active admin resource definitions."
  s.description = "Provides sortable_columns helper in active admin resource definitions."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "< 6.1", ">= 3.2.5"

  # Development server
  s.add_development_dependency "thin"

  # Development database
  s.add_development_dependency "sqlite3"

  # Documentation
  s.add_development_dependency "yard"

  # Dummy app
  s.add_development_dependency 'activeadmin'
  s.add_development_dependency 'awesome_nested_set'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # Test automation
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'rb-inotify', '~> 0.9'
end

