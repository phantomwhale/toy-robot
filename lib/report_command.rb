class ReportCommand
  def initialize(io)
    @io = io
  end

  def execute(robot)
    @io.puts "Output: #{robot.x},#{robot.y},#{robot.facing}" if robot.placed?
  end
end
