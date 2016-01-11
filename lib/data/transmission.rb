module Vinbot
  module Data
    class Transmission < Sequel::Model
      one_to_many :vehicles
    end
  end
end