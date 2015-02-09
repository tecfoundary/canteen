$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "canteen/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "canteen"
  s.version     = Canteen::VERSION
  s.authors     = ["Gaurav Cheema"]
  s.email       = ["gcheema@tecfoundary.com"]
  s.homepage    = "https://github.com/tecfoundary/canteen"
  s.summary     = "Simple eCommerce"
  s.description = "Simple eCommerce"
  s.license     = "MIT"


  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"

  # Admin theme
  s.add_dependency "adminlte-rails"

  # Image manas.add_dependencyent
  s.add_dependency "carrierwave-aws"

  # Support for orm mapper
  s.add_dependency "carrierwave-mongoid" #, require: "carrierwave/mongoid"

  # Security
  s.add_dependency "devise"

  # Templating
  s.add_dependency "liquid"

  s.add_dependency 'jquery-datatables-rails', '~> 3.1.1'

  s.add_dependency 'jquery-fileupload-rails', '~> 0.4.4'
  
  # Use jQuery as the JavaScript library
  s.add_dependency "jquery-rails", "~> 4.0.0.beta2"

  # This makes links to work as per prior to RAILS v 4.0.
  s.add_dependency "jquery-turbolinks"

  # Pagination
  s.add_dependency "kaminari"

  # Bootstrap
  s.add_dependency "less-rails-bootstrap"

  # Rails Fontawesome support
  s.add_dependency "font-awesome-rails"

  # Used by Carrierwave to do image resizing
  s.add_dependency "mini_magick"

  # Mongoid
  s.add_dependency "mongoid"

  # To generate page names in paths
  s.add_dependency "mongoid-slug"

  # For migrations
  s.add_dependency "mongoid_rails_migrations"
  
  # Pagedown - markup editor used by Stackoverflow
  # Manually importing so behaviour can be modified for image & link dialogs
  # s.add_dependency "pagedown-bootstrap-rails"

  # Required by Slim engine to render markdown
  s.add_dependency "redcarpet"

  # Slim Templates
  s.add_dependency "slim-rails"

  # Use SCSS for stylesheets
  s.add_dependency "sass-rails", "~> 5.0.0.beta1"

  # Use CoffeeScript for .coffee assets and views
  s.add_dependency "coffee-rails", "~> 4.1.0"

  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  s.add_dependency "turbolinks"

  # needed as bootstrap rails uses less
  s.add_dependency 'therubyracer'

  # Use Uglifier as compressor for JavaScript assets
  s.add_dependency "uglifier", ">= 1.3.0"

  s.require_path = 'lib'
end
