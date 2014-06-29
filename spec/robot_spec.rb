require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot) { Robot.new }

  describe 'placing robot on the table' do
    before do 
      robot.place(1, 2, 'NORTH') 
    end

    it 'sets the x coordinate' do
      expect(robot.x).to be 1
    end

    it 'sets the y coordinate' do
      expect(robot.y).to be 2
    end

    it 'sets the facing' do
      expect(robot.facing).to eq 'NORTH'
    end
  end
end
