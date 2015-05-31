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

  # Image manas.add_dependencyent
  s.add_dependency "carrierwave-aws"

  # Support for orm mapper
  s.add_dependency "carrierwave-mongoid" #, require: "carrierwave/mongoid"

  # Security
  s.add_dependency "devise"

  s.add_dependency "liquid"

  # Google Analytics
  s.add_dependency "google-analytics-rails"

  # Mongoid
  s.add_dependency "mongoid"

  # For migrations
  s.add_dependency "mongoid_rails_migrations"

  # Running active jobs
  s.add_dependency "delayed_job_mongoid"
  
  s.add_dependency 'coffee-rails', '~> 4.1.0'

  # Rails Fontawesome support
  s.add_dependency 'font-awesome-rails'

  # FullCalendar js by Adam Shaw - http://arshaw.com/fullcalendar/
  s.add_dependency 'fullcalendar-rails'

  # For checkboxes & radioboxes with Adminlte
  s.add_dependency 'icheck-rails'

  # Ion icons 
  s.add_dependency 'ionicons-rails'

  # Use jQuery as the JavaScript library
  s.add_dependency 'jquery-rails'

  s.add_dependency 'jquery-datatables-rails', '~> 3.1.1'

  s.add_dependency 'jquery-fileupload-rails'

  # This makes links to work as per earlier.
  s.add_dependency 'jquery-turbolinks'

  # Used by Adminlte theme on calendar page
  s.add_dependency 'jquery-ui-rails'

  # Bootstrap
  s.add_dependency 'less-rails-bootstrap'

  # Used by Carrierwave to do image resizing
  s.add_dependency "mini_magick"

  s.add_dependency "redcarpet"
 
  # Dependency for fullCalendar s.add_dependency
  s.add_dependency 'momentjs-rails'

  # Use SCSS for stylesheets
  s.add_dependency 'sass-rails', '~> 5.0'

  # Slim Templates
  s.add_dependency 'slim-rails'

  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  s.add_dependency 'turbolinks'

  # Use Uglifier as compressor for JavaScript assets
  s.add_dependency "uglifier", ">= 1.3.0"

  s.require_path = 'lib'
end
