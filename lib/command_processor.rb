class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command_text)
    CommandFactory.create(command_text, @robot)
  end
end

class CommandFactory
  def self.create(command_text, robot)
    @robot = robot
    if command_text =~ /^PLACE /
      params = command_text.split.last
      @robot.place(*params.split(","))
    elsif @robot.placed?
      if command_text == 'MOVE'
        @robot.move
      elsif command_text == 'LEFT'
        @robot.left
      elsif command_text == 'RIGHT'
        @robot.right
      elsif command_text == 'REPORT'
        puts "Output: #{@robot.x},#{@robot.y},#{@robot.facing}"
      end
    end
  end
end
