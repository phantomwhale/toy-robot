class ReportCommand
  def initialize(robot, io)
    @robot = robot
    @io = io
  end

  def execute
    location = @robot.location
    @io.puts location unless location.nil?
  end
end
