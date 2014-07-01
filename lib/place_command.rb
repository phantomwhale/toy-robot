class PlaceCommand
  def initialize(robot, *args)
    @robot = robot
    @args = args
  end

  def execute
    @robot.place(*@args)
  end
end

