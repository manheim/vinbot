require 'vinbot/vehicle'

module Vinbot
  class Vin

    class << self

      def generate(options={})
        vehicle = Vinbot::Vehicle.new(options)
        build(vehicle)
      end

      def build(vehicle)
        p vehicle
        vin_digits = Array.new(11) { '_'}
        vin_digits[0] = vehicle.country_of_origin_code
        vin_digits[1] = vehicle.manufacturer_code
        vin_digits[2] = vehicle.make_code
        vin_digits[3] = vehicle.model_code
        vin_digits[4] = vehicle.trim_code
        vin_digits[5] = vehicle.body_type_code
        vin_digits[6] = vehicle.restraint_system_code
        vin_digits[7] = vehicle.engine_code
        vin_digits[9] = vehicle.year_code
        vin_digits[10] = vehicle.plant_code
        vin_digits += serial
        vin_digits[8] = calculate_check_digit(vin_digits)
        vin_digits.join
      end

      private

      def calculate_check_digit(partial_vin)
        values = mapped_vin_values(partial_vin)
        values = weighted_values(values)
        check_digit_value(sum_of_products(values))
      end

      def check_digit_value(total)
        return 'X' if total % 11 == 10
        total % 11
      end

      def serial
        (sprintf '%06d', SecureRandom.random_number(999999)).split(//)
      end

      def mapped_vin_values(partial_vin)
        values = partial_vin.map { |v| Vinbot::VinConstants::EBCDIC_MAP[v].nil? ? v : Vinbot::VinConstants::EBCDIC_MAP[v] }
        values.map! { |v| v.to_i }
        values
      end

      def weighted_values(values)
        (0...values.count).inject([]) {|r, i| r << values[i] * Vinbot::VinConstants::WEIGHT_FACTORS[i]}
      end

      def sum_of_products(products)
        products.inject(:+)
      end
    end

  end
end