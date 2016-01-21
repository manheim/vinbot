module Vinbot
  module Data
    class EngineType < Sequel::Model
      one_to_many :vehicles
    end
  end
end