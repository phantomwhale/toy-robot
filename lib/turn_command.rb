class TurnCommand
  LEFT = -1
  RIGHT = 1

  def initialize(robot, direction)
    @robot = robot
    @direction = direction
  end

  def execute
    @robot.clockwise_turn(@direction)
  end
end
