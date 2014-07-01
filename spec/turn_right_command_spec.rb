require 'spec_helper'
require 'turn_right_command'

describe TurnRightCommand do
  let(:robot) { double("robot") }
  let(:command) { TurnRightCommand.new(robot) }

  describe "#execute" do
    it "turns the robot right" do
      expect(robot).to receive(:right)
      command.execute
    end
  end
end
