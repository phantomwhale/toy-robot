require 'spec_helper'
require 'robot'

describe Robot do
  let(:robot) { Robot.new }

  it 'starts not placed' do
    expect(robot).to_not be_placed
  end

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

    it 'marks the robot as placed' do
      expect(robot).to be_placed
    end
  end

  context 'when using paramters with explicit conversions to the required types' do
    before do
      robot.place('1', '2', :NORTH)
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

  context 'when trying to place the robot on a non-legal square' do
    before do 
      robot.place(8, 2, 'WEST')
    end

    it 'does not place the robot' do
      expect(robot).to_not be_placed
    end
  end

  context 'when robot has already been placed' do
    let(:facing) { 'NORTH' }

    before do
      robot.place(2, 0, facing)
    end

    describe '#move' do
      it 'moves the robot one step forward' do
        expect { robot.move }.to change { robot.y }.by(1)
      end

      context 'when the robot has a different facing' do
        let(:facing) { 'EAST' }

        it 'moves the robot one step in the direction of facing' do
          expect { robot.move }.to change { robot.x }.by(1)
        end
      end

      context 'when the robot is facing the edge of the table' do
        let(:facing) { 'SOUTH' }
        
        it 'does not move the robot' do
          expect { robot.move }.to_not change { robot.y }
        end
      end
    end

    describe '#left' do
      it 'turns the robot to the left' do
        robot.left
        expect(robot.facing).to eq 'WEST'
      end
    end

    describe '#right' do
      it 'turns the robot to the right' do
        robot.right
        expect(robot.facing).to eq 'EAST'
      end
    end
  end
end
