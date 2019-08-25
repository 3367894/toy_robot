require 'spec_helper'

describe Robot do
  describe '#on_table?' do
    it 'returns false after initialize' do
      expect(subject.on_table?).to be_falsey
    end

    it 'returns true is position and facing are valid' do
      subject.facing = :north
      subject.position.x = 1
      subject.position.y = 1

      expect(subject.on_table?).to be_truthy
    end

    it 'returns false if facing is invalid' do
      subject.facing = nil
      subject.position.x = 1
      subject.position.y = 1

      expect(subject.on_table?).to be_falsey
    end

    it 'returns false if position.x is invalid' do
      subject.facing = :north
      subject.position.x = -1
      subject.position.y = 1

      expect(subject.on_table?).to be_falsey
    end

    it 'returns false if position.y is invalid' do
      subject.facing = :north
      subject.position.x = 1
      subject.position.y = -1

      expect(subject.on_table?).to be_falsey
    end
  end

  describe '#valid_facing?' do
    it 'returns true if facing is from list' do
      expect(subject.valid_facing?(:north)).to be_truthy
    end

    it 'returns false if facing is not from list' do
      expect(subject.valid_facing?(:wrong_facing)).to be_falsey
    end
  end
end
