module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :country_of_origin, :manufacturer, :restraint_system, :engine, :plant,
                  :year_code, :make_code, :model_code, :trim_code, :country_of_origin_code, :manufacturer_code,
                  :restraint_system_code, :engine_code, :plant_code, :vin

    def thing

    end

    def check_digit
      self.vin.each_with_index { |v, i| v[i] }
    end

  end
end


