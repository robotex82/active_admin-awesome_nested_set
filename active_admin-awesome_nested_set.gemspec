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
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.5"

  s.add_development_dependency "sqlite3"
  
  # Documentation
  s.add_development_dependency "yard"  
  s.add_development_dependency "thin" 
end
