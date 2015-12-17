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
      options.each do |key, value|
        params << "#{key} like '%#{value}%'"
      end
      @db.execute("select * from vehicles where #{params.join(" AND ")}")
    end

  end
end