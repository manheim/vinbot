class InteriorColor < Sequel::Model
  one_to_many :vehicles
end