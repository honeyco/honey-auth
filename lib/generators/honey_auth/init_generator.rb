require 'rails/generators/active_record/migration'
require 'generators/honey_auth/base'

module HoneyAuth
  module Generators

    class Init < Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def create_migration_file
        template 'user_model.rb', 'app/models/user.rb'
        migration_template 'user_migration.rb', 'db/migrate/create_users'
      end
    end

  end
end
