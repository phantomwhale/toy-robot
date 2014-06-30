require_relative 'command_factory' 

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
