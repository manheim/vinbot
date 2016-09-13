module Vinbot
  module Data
    class Vehicle < Sequel::Model
      many_to_one :year
      many_to_one :make
      many_to_one :model
      many_to_one :trim
      many_to_one :body_type
      many_to_one :drivetrain
      many_to_one :engine_type
      many_to_one :exterior_color
      many_to_one :interior_color
      many_to_one :transmission
      many_to_one :vehicle_type

      def self.get_vehicle(params)
        return get_random_vehicle if params.empty?
        join_query = perform_joins(params)
        add_conditions_to_join(join_query, params).order(Sequel.lit('RANDOM()')).limit(1).first
      end

      def self.perform_joins(params)
        params.keys.inject(from(:vehicles)) { |r, e| r.join("#{e}s".to_sym, :id => "vehicles__#{e}_id".to_sym) }
      end

      def self.add_conditions_to_join(join_query, params)
        params.inject(join_query) { |r, e| r.where("#{e.first}s__name".to_sym => e.last) }
      end

      def self.get_random_vehicle
        count = ::Vinbot::Data::Vehicle.count
        ::Vinbot::Data::Vehicle.where(id: rand(count)).first
      end
    end
  end
end
