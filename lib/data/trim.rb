module Vinbot
  module Data
    class Trim < Sequel::Model
      one_to_many :vehicles
    end
  end
end