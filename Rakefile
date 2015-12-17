require "bundler/gem_tasks"
require 'sqlite3'
require 'pry'

namespace :db do
  task :migrate do
    puts "Running database migrations .."
    migration_files = Dir['./db/migrations/*.sql']
    db = SQLite3::Database.new "vindata.db"
    migration_files.each do |file|
      puts "Applying migration file #{file}"
      begin
      db.execute File.read(file)
      rescue Exception => e
        puts e
      end
    end
  end

  task :seed_data do
    puts "Generating seed data ..."
    seed_data_files = Dir['./db/seeds/*.sql']
    db = SQLite3::Database.new "vindata.db"
    seed_data_files.each do |file|
      puts "Applying seed data file #{file}"
      db.execute File.read(file)
    end
  end
end

