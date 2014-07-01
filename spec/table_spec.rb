require 'spec_helper'
require 'table'

describe Table do
  let(:table) { Table.new(3,3) }

  describe '#within_edges?' do
    it 'returns true when co-ordinates inside all table edges' do
      expect(table.within_edges?(1,2)).to be true
    end

    it 'returns false when co-ordinates are over the left hand edge' do
      expect(table.within_edges?(-1,2)).to be false
    end

    it 'returns false when co-ordinates are over the top edge' do
      expect(table.within_edges?(1,3)).to be false
    end
  end
end
