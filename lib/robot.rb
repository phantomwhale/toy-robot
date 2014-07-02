require_relative 'table'
require_relative 'position'

class Robot
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :position, :facing

  def initialize(table)
    @table = table
  end

  def place(position, facing)
    change_position(position)
    @facing = facing.to_s
  end

  def move
    return unless placed?
    change_position(@position.send(@facing.downcase))
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def location 
    "#{@position},#{@facing}" if placed?
  end

  def placed?
    !(@position.nil?)
  end

  private

  def turn(adjustment)
    return unless placed?
    index = FACINGS.index(@facing)
    @facing = FACINGS.rotate(adjustment)[index]
  end

  def change_position(position) 
    if @table.within_edges?(position)  
      @position = position
    end
  end
end
