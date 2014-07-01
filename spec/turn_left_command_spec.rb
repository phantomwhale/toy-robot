require 'spec_helper'
require 'turn_left_command'

describe TurnLeftCommand do
  let(:robot) { double("robot") }
  let(:command) { TurnLeftCommand.new(robot) }

  describe "#execute" do
    it "turns the robot left" do
      expect(robot).to receive(:left)
      command.execute
    end
  end
end
