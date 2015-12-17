require './spec/spec_helper'

describe('Vehicle') do

  it('should return a vehicle') do
    vehicle = Vinbot::Vehicle.new
    vehicle.is_a? Vinbot::Vehicle
  end

end