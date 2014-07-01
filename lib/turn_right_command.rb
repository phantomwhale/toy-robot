class TurnRightCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.right
  end
end

