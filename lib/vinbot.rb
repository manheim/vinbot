require "vinbot/vehicle"
require "vinbot/vin"
require "securerandom"
require "pry"
require "pry-nav"
require 'vin_bank'
require 'sequel'
require 'sqlite3'

DB = Sequel.sqlite(VinBank.db_path)
Dir[File.expand_path('lib/data/*.rb')].each {|file| require file }


module Vinbot

end


