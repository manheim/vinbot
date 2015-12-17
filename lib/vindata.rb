require 'sqlite3'

module Vindata
  class Index

    DATABASE_FILE = './vindata.db'

    attr_accessor :years, :makes, :models, :index
    @db = ::SQLite3::Database.new DATABASE_FILE
    @db.results_as_hash = true

    def self.get_vehicle_info(options={})
      options.empty? ? get_random_vehicle : get_vehicle_with(options)
    end


    def self.get_random_vehicle
      ids = @db.execute 'select id from vehicles'
      id = ids.flatten.sample
      sql = "select * from vehicles where id = #{id['ID']}"
      @db.execute(sql).flatten
    end

    def self.get_vehicle_with(options={})
      params = []
      binding.pry
      options.each do |key, value|
        params << "#{key} = #{value}"
      end
      @db.execute("select * from vehicles where #{params.join(" AND ")}")
    end

    # def self.index
    #   @index
    # end
    #
    # def self.years
    #   year_range = []
    #   @index['vehicles'].each { |model| year_range << (model['start_year']..model['end_year']).to_a }
    #   year_range.flatten.uniq.sort
    # end
    #
    # def self.makes
    #   @index['vehicles'].collect { |model| model['make'] }.uniq.sort
    # end
    #
    # def self.models
    #   @index['vehicles'].collect { |model| model['model'] }.uniq.sort
    # end

    # def self.vehicle_file(options={})
    #   return @index['vehicles'].sample['file'] if options.empty?
    #   return file_by_model(options[:model]) if options[:model]
    #   return file_by_make(options[:make]) if options[:make]
    #   return file_by_year(options[:year]) if options[:year]
    #   binding.pry
    # end
    #
    # def self.file_by_model(model)
    #   throw('model doesnt exist') unless models.include?(model)
    #   files = []
    #   @index['vehicles'].each do |vehicle|
    #     files << vehicle['file'] if vehicle['model'].include?(model)
    #   end
    #   files.sample
    # end
    #
    # def self.file_by_make(make)
    #   throw('make doesnt exist') unless makes.include?(make)
    #   files = []
    #   @index['vehicles'].each do |vehicle|
    #     files << vehicle['file'] if vehicle['make'].include?(make)
    #   end
    #   files.sample
    # end
    #
    # def self.file_by_year(year)
    #   throw('year doesnt exist') unless years.include?(year)
    #   files = []
    #   @index['vehicles'].each do |vehicle|
    #     files << vehicle['file'] if year >= vehicle['start_year'] && year <= vehicle['end_year']
    #   end
    #   files.sample
    # end


  end
end