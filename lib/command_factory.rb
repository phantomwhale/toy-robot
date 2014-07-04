require_relative 'place_command'
require_relative 'move_command'
require_relative 'turn_command'
require_relative 'report_command'
require_relative 'unknown_command'

class CommandFactory
  def initialize(robot, io = STDOUT)
    @robot = robot
    @io = io
  end

  def create(instruction)
    if instruction =~ /^PLACE /
      params = instruction.split.last
      PlaceCommand.new(@robot, *params.split(","))
    elsif instruction == 'MOVE'
      MoveCommand.new(@robot)
    elsif instruction == 'LEFT'
      TurnCommand.new(@robot, TurnCommand::LEFT)
    elsif instruction == 'RIGHT'
      TurnCommand.new(@robot, TurnCommand::RIGHT)
    elsif instruction == 'REPORT'
      ReportCommand.new(@robot, @io)
    else
      UnknownCommand.new(instruction, @io)
    end
  end
end
