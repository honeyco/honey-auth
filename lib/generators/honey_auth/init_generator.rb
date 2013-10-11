require 'rails/generators/active_record'
require 'generators/honey_auth/base'

module HoneyAuth
  module Generators

    class Init < Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)

      def create_migration_file
        migration_template 'user_migration.rb', 'db/migrate/create_users'
        template 'user_model.rb', 'app/models/user.rb'
        template 'accounts_controller.rb', 'app/controllers/accounts_controller.rb'
        template 'sessions_controller.rb', 'app/controllers/sessions_controller.rb'
        directory 'views/sessions', 'app/views/sessions'
        directory 'views/accounts', 'app/views/accounts'

        inject_into_file 'app/controllers/application_controller.rb', before: 'end' do
          '  include Authentication' << "\n"
        end
      end

      def self.next_migration_number(dirname)
        ActiveRecord::Generators::Base.next_migration_number(dirname)
      end
    end

  end
end
