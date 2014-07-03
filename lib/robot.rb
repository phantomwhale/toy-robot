require_relative 'table'
require_relative 'position'

class Robot
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :position, :facing

  def initialize(table)
    @table = table
  end

  def place(position, facing)
    move_to(position)
    @facing = facing
  end

  def step_forward
    move_to(@position.send(@facing.downcase)) if placed?
  end

  def left
    clockwise_turn(-1)
  end

  def right
    clockwise_turn(1)
  end

  def location 
    "#{@position},#{@facing}" if placed?
  end

  def placed?
    !(@position.nil?)
  end

  def clockwise_turn(steps)
    index = FACINGS.index(@facing)
    @facing = FACINGS.rotate(steps)[index] if placed?
  end

  private

  def move_to(position) 
    if @table.within_edges?(position)  
      @position = position
    end
  end
end
