class MoveCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.step_forward
  end
end

