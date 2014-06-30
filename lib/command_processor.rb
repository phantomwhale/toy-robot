class CommandProcessor
  def initialize(robot, io = STDOUT)
    @robot = robot
    @command_factory = CommandFactory.new(io)
  end

  def process(command_text)
    command = @command_factory.create(command_text)
    command.execute(@robot)
  end
end

class CommandFactory
  def initialize(io)
    @io = io
  end

  def create(command_text)
    if command_text =~ /^PLACE /
      params = command_text.split.last
      PlaceCommand.new(*params.split(","))
    elsif command_text == 'MOVE'
      MoveCommand.new
    elsif command_text == 'LEFT'
      TurnLeftCommand.new
    elsif command_text == 'RIGHT'
      TurnRightCommand.new
    elsif command_text == 'REPORT'
      ReportCommand.new(@io)
    end
  end
end

class PlaceCommand
  def initialize(*args)
    @args = args
  end

  def execute(robot)
    robot.place(*@args)
  end
end

class MoveCommand
  def execute(robot)
    robot.move if robot.placed?
  end
end

class TurnLeftCommand
  def execute(robot)
    robot.left if robot.placed?
  end
end

class TurnRightCommand
  def execute(robot)
    robot.right if robot.placed?
  end
end

class ReportCommand
  def initialize(io)
    @io = io
  end

  def execute(robot)
    @io.puts "Output: #{robot.x},#{robot.y},#{robot.facing}" if robot.placed?
  end
end
