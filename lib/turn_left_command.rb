class TurnLeftCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.left
  end
end

