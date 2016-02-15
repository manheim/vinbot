require 'securerandom'
require 'sequel'
require 'vin_bank'
require 'vinbot/vehicle'
require 'vinbot/vin'

if RUBY_PLATFORM == 'java'
  require 'jdbc/sqlite3'
  DB = Sequel.connect("jdbc:sqlite:///#{VinBank.db_path}")
else
  require 'sqlite3'
  DB = Sequel.sqlite(VinBank.db_path)
end

Dir["#{File.dirname(__FILE__)}/data/*.rb"].each { |file| require file }

module Vinbot

end