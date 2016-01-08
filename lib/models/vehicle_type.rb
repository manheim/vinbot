class VehicleType < Sequel::Model
  one_to_many :vehicles
end