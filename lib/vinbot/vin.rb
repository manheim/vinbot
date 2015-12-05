module Vinbot
  class Vin

    class << self

      attr_accessor :partial_vin

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
        sprintf '%06d', SecureRandom.random_number(999999)
      end

      def mapped_vin_values(partial_vin)
        partial_vin.map! { |v| Vinbot::VinConstants::EBCDIC_MAP[v].nil? ? v : Vinbot::VinConstants::EBCDIC_MAP[v] }
        partial_vin.map! { |v| v.to_i }
        partial_vin
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