module Vinbot
  module Data
    class Model < Sequel::Model
      one_to_many :vehicles
    end
  end
end
