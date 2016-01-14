require './spec/spec_helper'

describe('Vehicle') do

  it('should return a vehicle') do
    expect(Vinbot::Data::Vehicle.new).to be_a_kind_of Vinbot::Data::Vehicle
  end

  it('should return vehicle with year parameter') do
    vehicle = Vinbot::Vehicle.new(year: 2011)
    expect(vehicle.year).to eql 2011
  end

  it('should return vehicle with make parameter') do
    vehicle = Vinbot::Vehicle.new(make: "Ford")
    expect(vehicle.make).to eql "Ford"
  end

  it('should return vehicle with model parameter') do
    vehicle = Vinbot::Vehicle.new(model: "Focus")
    expect(vehicle.model).to eql "Focus"
  end

end