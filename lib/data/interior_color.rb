module Vinbot
  module Data
    class InteriorColor < Sequel::Model
      one_to_many :vehicles
    end
  end
end