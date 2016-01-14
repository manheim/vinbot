module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :engine_type, :transmission, :body_type, :vehicle_type, :drivetrain,
                  :interior_colors, :exterior_colors, :vin

    def initialize(params = {})
      params_ids = parse_params(params)
      vehicle = ::Vinbot::Data::Vehicle.where(params_ids).order(Sequel.lit('RANDOM()')).limit(1).first
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
      @vin = Vin.generate_from_squish_vin(vehicle.squish_vin)
    end

    private

    def parse_params(params)
      params_ids = {}
      params_ids[:year_id] = year_id(params[:year]) if params[:year]
      params_ids[:make_id] = make_id(params[:make]) if params[:make]
      params_ids[:model_id] = year_id(params[:model]) if params[:model]
      params_ids
    end

    def year_id(year)
      ::Vinbot::Data::Year.first(name: year).id
    end

    def make_id(make)
      ::Vinbot::Data::Make.first(name: make).id
    end

    def model_id(model)
      ::Vinbot::Data::Model.first(name: model).id
    end

  end
end
