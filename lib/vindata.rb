require 'yaml'

module Vindata
  class Index

    INDEX_FILE = './lib/vinbot/data/index.yml'

    attr_accessor :years, :makes, :models, :index
    @index = YAML.load_file(INDEX_FILE)

    def self.get_model_info(options={})
      YAML.load_file("./lib/vinbot/data/#{vehicle_file(options)}")
    end

    def self.index
      @index
    end

    def self.years
      year_range = []
      @index['vehicles'].each { |model| year_range << (model['start_year']..model['end_year']).to_a }
      year_range.flatten.uniq.sort
    end

    def self.makes
      @index['vehicles'].collect { |model| model['make'] }.uniq.sort
    end

    def self.models
      @index['vehicles'].collect { |model| model['model'] }.uniq.sort
    end

    def self.vehicle_file(options={})
      return @index['vehicles'].sample['file'] if options.empty?
      return file_by_model(options[:model]) if options[:model]
      return file_by_make(options[:make]) if options[:make]
      return file_by_year(options[:year]) if options[:year]
      binding.pry
    end

    def self.file_by_model(model)
      throw('model doesnt exist') unless models.include?(model)
      files = []
      @index['vehicles'].each do |vehicle|
        files << vehicle['file'] if vehicle['model'].include?(model)
      end
      files.sample
    end

    def self.file_by_make(make)
      throw('make doesnt exist') unless makes.include?(make)
      files = []
      @index['vehicles'].each do |vehicle|
        files << vehicle['file'] if vehicle['make'].include?(make)
      end
      files.sample
    end

    def self.file_by_year(year)
      throw('year doesnt exist') unless years.include?(year)
      files = []
      @index['vehicles'].each do |vehicle|
        files << vehicle['file'] if year >= vehicle['start_year'] && year <= vehicle['end_year']
      end
      files.sample
    end

  end
end