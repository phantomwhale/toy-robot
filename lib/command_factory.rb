require_relative 'place_command'
require_relative 'move_command'
require_relative 'turn_left_command'
require_relative 'turn_right_command'
require_relative 'report_command'

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
      TurnLeftCommand.new(@robot)
    elsif instruction == 'RIGHT'
      TurnRightCommand.new(@robot)
    elsif instruction == 'REPORT'
      ReportCommand.new(@robot, @io)
    end
  end
end
