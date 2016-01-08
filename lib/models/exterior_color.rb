class ExteriorColor < Sequel::Model
  one_to_many :vehicles
end