module Vinbot
  module Data
    class Make < Sequel::Model
      one_to_many :vehicles
    end
  end
end
