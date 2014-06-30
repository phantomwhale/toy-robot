class PlaceCommand
  def initialize(*args)
    @args = args
  end

  def execute(robot)
    robot.place(*@args)
  end
end

