require 'spec_helper'

describe Tabletop do
  describe 'read config' do
    it 'sets dimensions' do
      expect(subject.dimensions.x).to eq(3)
      expect(subject.dimensions.y).to eq(3)
    end
  end

  describe '#valid_position?' do
    it 'returns true if everything is ok' do
      expect(subject.valid_position?(x: 1, y: 2)).to be_truthy
    end

    it 'returns false if x is less than 0' do
      expect(subject.valid_position?(x: -1, y: 2)).to be_falsey
    end

    it 'returns false if y is less than 0' do
      expect(subject.valid_position?(x: 1, y: -2)).to be_falsey
    end

    it 'returns false if x is greater than max x' do
      expect(subject.valid_position?(x: 4, y: 2)).to be_falsey
    end

    it 'returns false if y is greater than max y' do
      expect(subject.valid_position?(x: 1, y: 4)).to be_falsey
    end
  end
end
