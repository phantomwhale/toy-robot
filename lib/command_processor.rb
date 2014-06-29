class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    params = command.split.last
    @robot.place(*params.split(","))
  end
end
