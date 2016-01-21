module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :engine_type, :transmission, :body_type, :vehicle_type, :drivetrain,
                  :interior_colors, :exterior_colors, :vin

    def initialize
      vehicle = ::Vinbot::Data::Vehicle.order(Sequel.lit('RANDOM()')).limit(1).first
      @year = vehicle.year.name
      @make = vehicle.make.name
      @model = vehicle.model.name
      @trim = vehicle.trim.name
      @engine_type = vehicle.engine_type.name
      @transmission = vehicle.transmission.name
      @body_type = vehicle.body_type.name
      @vehicle_type = vehicle.vehicle_type.name
      @drivetrain = vehicle.drivetrain.name
      @interior_colors = vehicle.interior_color.name.split(',')
      @exterior_colors = vehicle.exterior_color.name.split(',')
      @vin = Vin.generate_from_partial_vin(vehicle.partial_vin)
    end

  end
end
