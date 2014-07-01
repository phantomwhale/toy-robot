require 'spec_helper'
require 'robot'

describe Robot do
  let(:table) { double("table", within_edges?: true) }
  let(:robot) { Robot.new(table) }

  it 'starts not placed' do
    expect(robot).to_not be_placed
  end

  describe '#place' do
    context 'when placing the robot on a valid location' do
      before do 
        robot.place(1, 2, 'NORTH') 
      end

      it 'sets the position' do
        expect(robot.position).to eq Position.new(1,2)
      end

      it 'sets the facing' do
        expect(robot.facing).to eq 'NORTH'
      end

      it 'marks the robot as placed' do
        expect(robot).to be_placed
      end
    end

    context 'when using parameters which need explicit conversions' do
      before do
        robot.place('1', '2', :NORTH)
      end

      it 'sets the position' do
        expect(robot.position).to eq Position.new(1,2)
      end

      it 'sets the facing' do
        expect(robot.facing).to eq 'NORTH'
      end
    end

    context 'when trying to place the robot on a non-legal square' do
      before do 
        allow(table).to receive(:within_edges?).and_return(false)
        robot.place(8, 2, 'WEST')
      end

      it 'does not place the robot' do
        expect(robot).to_not be_placed
      end
    end
  end

  context 'when robot has already been placed' do
    let(:facing) { 'NORTH' }

    before do
      robot.place(2, 0, facing)
    end

    describe '#move' do
      it 'moves the robot one step forward' do
        expect { robot.move }.to change { robot.position.y }.by(1)
      end

      context 'when the robot has a different facing' do
        let(:facing) { 'EAST' }

        it 'moves the robot one step in the direction of facing' do
          expect { robot.move }.to change { robot.position.x }.by(1)
        end
      end

      context 'when the robot attempt to move off the edge of the table' do
        before do
          allow(table).to receive(:within_edges?).and_return(false)
        end

        it 'does not move the robot' do
          expect { robot.move }.to_not change { robot.position }
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

    describe '#location' do
      it 'reports the robot position and facing' do
        expect(robot.location).to eq "2,0,NORTH"
      end
    end
  end

  context 'when robot has not been placed' do
    describe '#move' do
      it 'does not move the robot' do
        expect { robot.move }.to_not change { robot.position }
      end
    end

    describe '#left' do
      it 'does not turn the robot' do
        expect { robot.left }.to_not change { robot.facing }
      end
    end

    describe '#right' do
      it 'does not turn the robot' do
        expect { robot.right }.to_not change { robot.facing }
      end
    end
  end
end
