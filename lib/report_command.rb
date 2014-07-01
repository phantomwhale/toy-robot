class ReportCommand
  def initialize(robot, io)
    @robot = robot
    @io = io
  end

  def execute
    position = @robot.position
    @io.puts position unless position.nil?
  end
end
