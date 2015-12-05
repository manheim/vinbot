require './spec/spec_helper'

describe('Indexes') do

  before do
    @index = Vindata::Index.new('./spec/spec_data/index-test.yml')
  end

  it('should index available years') do
    expect(@index.years).to eql (2008..2016).to_a
  end

  it('should index available makes') do
    expect(@index.makes).to eql ['Chevrolet', 'Ford']
  end

  it('should index available models') do
    expect(@index.models).to eql ['Camaro', 'Equinox', 'Focus', 'Ranger']
  end

  describe('Index Helpers') do

    it('should split year ranges') do
      expect(@index.send(:split_years, '2010-2013')).to eql [2010, 2011, 2012, 2013]
    end
  end

end