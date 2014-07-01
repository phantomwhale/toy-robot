require 'spec_helper'
require 'move_command'

describe MoveCommand do
  let(:robot) { double("robot") }
  subject(:command) { MoveCommand.new(robot) }

  describe '#execute' do
    it 'tells the robot to move' do
      expect(robot).to receive(:move)
      command.execute
    end
  end
end
