class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    if command =~ /^PLACE /
      params = command.split.last
      @robot.place(*params.split(","))
    elsif @robot.placed?
      if command == 'MOVE'
        @robot.move
      elsif command == 'LEFT'
        @robot.left
      elsif command == 'RIGHT'
        @robot.right
      elsif command == 'REPORT'
        puts "Output: #{@robot.x},#{@robot.y},#{@robot.facing}"
      end
    end
  end
end
