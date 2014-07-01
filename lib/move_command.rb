class MoveCommand
  def initialize(robot)
    @robot = robot
  end

  def execute
    @robot.move
  end
end

