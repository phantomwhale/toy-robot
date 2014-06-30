class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    if command =~ /^PLACE /
      params = command.split.last
      @robot.place(*params.split(","))
    elsif command == 'MOVE'
      @robot.move
    elsif command == 'REPORT'
      puts "Output: #{@robot.x},#{@robot.y},#{@robot.facing}"
    end
  end
end
