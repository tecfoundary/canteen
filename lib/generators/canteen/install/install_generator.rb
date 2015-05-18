require 'rails/generators/migration'

module Canteen
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      # include Rails::Generators::Migration

      # source_root File.expand_path('../templates', __FILE__)
      # desc "add migrations"

      # def self.next_migration_number(path)
      #   unless @prev_migration_nr
      #     @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
      #   else
      #     @prev_migration_nr += 1
      #   end
      #   @prev_migration_nr.to_s
      # end

      # def copy_migrations
      #   migration_template "generate_canteen_users.rb", "db/migrate/generate_canteen_users.rb"
      # end

      def routes
        inject_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do <<-'RUBY'
  
  mount Canteen::Engine => '/store'
  root 'canteen/store/products#index'

        RUBY
        end
      end

    end
  end
end