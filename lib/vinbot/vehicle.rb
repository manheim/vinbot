module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :engine_type, :transmission, :body_type, :vehicle_type, :drivetrain,
                  :interior_colors, :interior_color, :exterior_colors, :exterior_color, :vin

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
      @interior_colors = vehicle.interior_color.name
      @interior_color = @interior_colors.empty? ? '' : @interior_colors.split(',').sample
      @exterior_colors = vehicle.exterior_color.name
      @exterior_color = @exterior_colors.empty? ? '' : @exterior_colors.split(',').sample
      @squish_vin = vehicle.squish_vin
      @vin = Vin.generate_from_squish_vin(vehicle.squish_vin)
    end

  end
end
