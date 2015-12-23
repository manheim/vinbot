require "vinbot/vin_contants"
require "vinbot/vehicle"
require "vinbot/vin"
require "vindata"
require "securerandom"
require "pry"
require "pry-nav"
require 'vin_bank'
require 'sequel'
require 'sqlite3'


module Vinbot
  DB = Sequel.sqlite(VinBank.db_path)
end


