require './spec/spec_helper'

describe('Vehicle') do

  it('should return a vehicle') do
    expect(Vinbot::Data::Vehicle.new).to be_a_kind_of Vinbot::Data::Vehicle
  end

end