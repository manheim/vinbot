require 'securerandom'
require 'sequel'
require 'sqlite3'
require 'vin_bank'
require 'vinbot/vehicle'
require 'vinbot/vin'

DB = Sequel.sqlite(VinBank.db_path)
Dir["#{__dir__}/data/*.rb"].each {|file| require file }

module Vinbot

end