require 'spec_helper'
require 'position'

describe Position do
  let(:position) { Position.new(1,1) }

  describe '#north' do
    it 'returns the position north of this one' do
      expect(position.north).to eq Position.new(1,2)
    end
  end

  describe '#south' do
    it 'returns the position south of this one' do
      expect(position.south).to eq Position.new(1,0)
    end
  end

  describe '#east' do
    it 'returns the position east of this one' do
      expect(position.east).to eq Position.new(2,1)
    end
  end

  describe '#west' do
    it 'returns the position west of this one' do
      expect(position.west).to eq Position.new(0,1)
    end
  end
end
