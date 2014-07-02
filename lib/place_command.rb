require_relative 'position'

class PlaceCommand
  def initialize(robot, x, y, facing)
    @robot = robot
    @position = Position.new(x, y)
    @facing = facing
  end

  def execute
    @robot.place(@position, @facing)
  end
end

