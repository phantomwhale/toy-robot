require 'spec_helper'
require 'place_command'

describe PlaceCommand do
  let(:robot) { double("robot") }
  let(:args) { [double('x'), double('y'), double('facing')] }
  subject(:command) { PlaceCommand.new(robot, *args) }

  describe '#execute' do
    it 'tells the robot to move' do
      expect(robot).to receive(:place).with(*args)
      command.execute
    end
  end
end
