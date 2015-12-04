#require 'lib/vinbot'
require 'sqlite3'

module Vinbot
  class Setup

    def self.create_db
      db = vehicle_data
      db.execute(load_schema)
      db.close
    end

    def self.years
      db = vehicle_data
      db.execute("select * from years") do |rows|
        p rows
      end
      db.close
    end

    def self.seed_db
      db = vehicle_data
      db.execute(seed_years)
      db.close
    end

    def self.vehicle_data
      SQLite3::Database.new( "test.db" )
    end

    def self.seed_years
      "INSERT into YEARS (id, year) values (0, 2015)"
    end

    def self.seed_makes
    end

    def self.seed_models
    end

    def self.load_schema
      "IF EXISTS('years') DROP TABLE
      CREATE TABLE years(id INTEGER PRIMARY KEY ASC, year)"
    end

  end
end