module Vinbot
  module Data
    class BodyType < Sequel::Model
      one_to_many :vehicles
    end
  end
end
