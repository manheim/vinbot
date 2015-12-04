require 'securerandom'

module Vinbot
  class Vin

    attr_accessor :partial_vin

    def self.calculate_check_digit(partial_vin)
      values = self.mapped_vin_values(partial_vin)
      values = self.weighted_values(values)
      self.check_digit_value(self.sum_of_products(values))
    end

    def self.check_digit_value(total)
      return 'X' if total % 11 == 10
      total % 11
    end

    def self.serial
      sprintf '%02d', SecureRandom.random_number(999999)
    end

    def self.mapped_vin_values(partial_vin)
      value_map = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8, 'J' => 1, 'K' => 2,
                   'L' => 3, 'M' => 4, 'N' => 5, 'P' => 7, 'R' => 9, 'S' => 2, 'T' => 3, 'U' => 4, 'V' => 5, 'W' => 6,
                   'X' => 7, 'Y' => 8, 'Z' => 9 }

      partial_vin.map! { |v| value_map[v].nil? ? v : value_map[v] }
      partial_vin.map! { |v| v.to_i }
      partial_vin
    end

    def self.weights
      [8,	7,	6,	5,	4,	3, 2,	10,	0,	9,	8,	7,	6, 5, 4, 3, 2]
    end

    def self.weighted_values(values)
      (0...values.count).inject([]) {|r, i| r << values[i] * self.weights[i]}
    end

    def self.sum_of_products(products)
      products.inject(:+)
    end

  end
end