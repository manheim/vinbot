require './spec/spec_helper'

describe('Vin') do
  describe '.generate' do
    let(:vin) { Vinbot::Vin.generate }

    it 'should return a 17 character string' do
      expect(vin.length).to eql 17
    end

    it('should be alphanumeric') do
      expect(vin.slice(/[A-Z0-9]+/)).to eql vin
    end
  end

  describe '.generate_from_squish_vin' do
    let(:vin) { Vinbot::Vin.generate_from_squish_vin('19UUA5671A') }

    it 'should return a 17 character string' do
      expect(vin.length).to eql 17
    end

    it('should be alphanumeric') do
      expect(vin.slice(/[A-Z0-9]+/)).to eql vin
    end
  end

  describe('check digit') do
    it('should map vin values') do
      expect(Vinbot::Vin.send(:mapped_vin_values, ['1', 'M', '8', 'G', 'D', 'M', '9', 'A', '_', 'K', 'P', '0', '4', '2', '7', '8', '8'])).to eql [1, 4, 8, 7, 4, 4, 9, 1, 0, 2, 7, 0, 4, 2, 7, 8, 8]
    end

    it('should calculate weighted values') do
      expect(Vinbot::Vin.send(:weighted_values, [1, 4, 8, 7, 4, 4, 9, 1, 0, 2, 7, 0, 4, 2, 7, 8, 8])).to eql [8, 28, 48, 35, 16, 12, 18, 10, 0, 18, 56, 0, 24, 10, 28, 24, 16]
    end

    it('should total the weighted values') do
      expect(Vinbot::Vin.send(:sum_of_products, [8, 28, 48, 35, 16, 12, 18, 10, 0, 18, 56, 0, 24, 10, 28, 24, 16])).to eql 351
    end

    it('should return correct check digit') do
      expect(Vinbot::Vin.send(:check_digit_value, 351)).to eql 'X'
      expect(Vinbot::Vin.send(:check_digit_value, 89)).to eql 1
    end

    it('should calculate check digit') do
      expect(Vinbot::Vin.send(:calculate_check_digit, '11111111_11111111'.split(//))).to eql 1
      expect(Vinbot::Vin.send(:calculate_check_digit, '1M8GDM9A_KP042788'.split(//))).to eql 'X'
    end

    it('serial sequence should be 6 digits') do
      expect(Vinbot::Vin.send(:serial).length).to eql 6
    end

  end

end

