module Mongoid
  module Generators
    class CounterGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      require 'rails/generators/migration'

      def self.next_migration_number path
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def create_migration_file
        migration_template 'my_table.rb', 'db/migrate/create_urls_table.rb'
      end
    end
  end
end
