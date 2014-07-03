require 'turn_command'

describe TurnCommand do
  let(:robot) { double("robot") }
  let(:command) { TurnCommand.new(robot, 1) }

  describe "#execute" do
    it "turns the robot clockwise the number of steps provided" do
      expect(robot).to receive(:clockwise_turn).with(1)
      command.execute
    end
  end
end
