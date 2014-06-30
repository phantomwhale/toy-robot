require_relative 'place_command'
require_relative 'move_command'
require_relative 'turn_left_command'
require_relative 'turn_right_command'
require_relative 'report_command'

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
