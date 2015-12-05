require 'yaml'

module Vindata
  class Index

    INDEX_FILE = './lib/vinbot/data/index.yml'

    attr_accessor :years, :makes, :models, :index

    def initialize(index_file = INDEX_FILE)
      @index = YAML.load_file(index_file)
      @years = self.years
      @makes = self.makes
      @models = self.models
    end

    def years
      year_range = []
      @index['models'].each { |model| year_range << split_years(model['years']) }
      year_range.flatten.uniq.sort
    end

    def makes
      @index['models'].collect { |model| model['make'] }.uniq.sort
    end

    def models
      @index['models'].collect { |model| model['model'] }.uniq.sort
    end

    private

    def split_years(year_range)
      year_bounds = year_range.scan(/\d+/)
      (year_bounds[0].to_i..year_bounds[1].to_i).to_a
    end

  end
end