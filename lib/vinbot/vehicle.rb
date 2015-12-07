require 'vindata'
require 'vinbot/vin'

module Vinbot
  class Vehicle

    attr_accessor :year, :make, :model, :trim, :country_of_origin, :manufacturer, :restraint_system, :engine, :plant, :body_type,
                  :year_code, :make_code, :model_code, :trim_code, :country_of_origin_code, :manufacturer_code, :body_type_code,
                  :restraint_system_code, :engine_code, :plant_code, :vin

    def initialize(options={})
      model_info = YAML.load_file("./lib/vinbot/data/#{model_file}")
      parse(model_info, options)
    end

    def generate_vin
      Vehicle::Vin.build(self)
    end

    private

    def parse(model_info, options)
      @country_of_origin = model_info['country']['name']
      @country_of_origin_code = model_info['country']['code']
      @manufacturer = model_info['manufacturer']['name']
      @manufacturer_code = model_info['manufacturer']['code']
      @make = model_info['make']['name']
      @make_code = model_info['make']['code']
      @model = model_info['model']['name']
      @model_code = model_info['model']['code']
      @body_type = model_info['body_type']['name']
      @body_type_code = model_info['body_type']['code']
      @restraint_system = model_info['restraint_system']['name']
      @restraint_system_code = model_info['restraint_system']['code']
      plant = model_info['plants'].sample
      @plant = plant['name']
      @plant_code = plant['code']
      year = options.has_key?(:year) ? select_random(model_info['years'].select { |hash| hash['name'].to_s.include?(options[:year].to_s) }) : model_info['years'].sample
      @year = year['name']
      @year_code = year['code']
      trim = options.has_key?(:trim) ? select_random(model_info['trims'].select { |hash| hash['name'].include?(options[:trim]) }) : model_info['trims'].sample
      @trim = trim['name']
      @trim_code = trim['code']
      @engine = trim['engine']['name']
      @engine_code = trim['engine']['code']
    end

    def select_random(values)
      values.sample
    end

    def model_file(options={})
      return Vindata::Index.new.index['models'].sample['file'] if options.empty?
    end

  end
end






# #vin
# Vinbot::Vin.generate
#
# #vehicle
# Vinbot::Vehicle.new(options={})
#
# options = {year: '', make: '', model: '', trim: ''}