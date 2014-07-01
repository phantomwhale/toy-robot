require_relative 'command_factory' 

class InstructionProcessor
  def initialize(command_factory)
    @command_factory = command_factory
  end

  def process(instruction)
    command = @command_factory.create(instruction)
    command.execute
  end
end
