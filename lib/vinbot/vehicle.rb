module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :engine_type, :transmission, :body_type, :vehicle_type, :drive_train,
                  :interior_colors, :interior_color, :exterior_colors, :exterior_color, :squish_vin, :vin

    def initialize(options={})
      @current_vehicle = ::Vinbot::Data::Vehicle.new
    end

    def generate_vin
      self.vin = Vinbot::Vin.build(self)
    end

    def parse(vehicle_info)
      self.year = vehicle_info['YEAR']
      self.make = vehicle_info['MAKE']
      self.model = vehicle_info['MODEL']
      self.trim = vehicle_info['TRIM']
      self.engine_type = vehicle_info['ENGINE_TYPE']
      self.transmission = vehicle_info['TRANSMISSION']
      self.body_type = vehicle_info['BODY_TYPE']
      self.vehicle_type = vehicle_info['VEHICLE_TYPE']
      self.drive_train = vehicle_info['DRIVE_TRAIN']
      self.interior_colors = vehicle_info['INTERIOR_COLORS']
      self.exterior_colors = vehicle_info['EXTERIOR_COLORS']
      self.squishvin = vehicle_info['SQUISHVIN']
    end

  end
end
