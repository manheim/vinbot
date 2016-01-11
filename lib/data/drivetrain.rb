module Vinbot
  module Data
    class Drivetrain < Sequel::Model
      one_to_many :vehicles
    end
  end
end
