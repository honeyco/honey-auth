require 'rails/generators/active_record/migration'
require 'generators/honey_auth/base'

module HoneyAuth
  module Generators

    class Init < Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def create_migration_file
        migration_template 'user_migration.rb', 'db/migrate/create_users'
        template 'user_model.rb', 'app/models/user.rb'
        template 'accounts_controller.rb', 'app/controllers/accounts_controller.rb'
        template 'session_controller.rb', 'app/controllers/session_controller.rb'
        directory 'views/sessions', 'app/views/sessions'
        directory 'views/accounts', 'app/views/accounts'
      end
    end

  end
end
