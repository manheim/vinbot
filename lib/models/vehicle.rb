class Vehicle < Sequel::Model
  many_to_one :year
  many_to_one :make
  many_to_one :model
  many_to_one :trim
  many_to_one :body_type
  many_to_one :drivetrain
  many_to_one :engine_type
  many_to_one :exterior_color
  many_to_one :interior_color
  many_to_one :transmission
  many_to_one :vehicle_type
end