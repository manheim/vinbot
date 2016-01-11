module Vinbot
  module Data
    class ExteriorColor < Sequel::Model
      one_to_many :vehicles
    end
  end
end