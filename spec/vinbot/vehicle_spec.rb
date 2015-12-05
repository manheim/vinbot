require './spec/spec_helper'

describe('Vehicle') do

  it('should return a vehicle') do
    vehicle = Vinbot::Vehicle.new
    vehicle.is_a? Vinbot::Vehicle
  end

  describe('parsing data') do

    it('should return a single file') do
      expect(Vinbot::Vehicle.send(:model_file)).to be_a(String)
    end


  end

end