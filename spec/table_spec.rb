require 'table'
require 'position'

describe Table do
  let(:table) { Table.new(3,3) }

  describe '#within_edges?' do
    it 'returns true when co-ordinates inside all table edges' do
      position = Position.new(1,2)
      expect(table.within_edges?(position)).to be true
    end

    it 'returns false when co-ordinates are over the left hand edge' do
      position = Position.new(-1,2)
      expect(table.within_edges?(position)).to be false
    end

    it 'returns false when co-ordinates are over the top edge' do
      position = Position.new(1,3)
      expect(table.within_edges?(position)).to be false
    end
  end
end
