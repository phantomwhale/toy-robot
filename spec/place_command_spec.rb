require 'place_command'

describe PlaceCommand do
  let(:robot) { double("robot") }
  let(:args) { [1, 3, 'SOUTH'] }
  subject(:command) { PlaceCommand.new(robot, *args) }

  describe '#execute' do
    it 'tells the robot to move' do
      expect(robot).to receive(:place).with(Position.new(1,3), 'SOUTH')
      command.execute
    end
  end
end
