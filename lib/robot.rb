require_relative 'table'

class Robot
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :position, :facing

  def initialize(table)
    @table = table
  end

  def place(x, y, facing)
    change_position(Position.new(x.to_i, y.to_i))
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
    if @table.within_edges?(position.x, position.y)  
      @position = position
    end
  end
end

Position = Struct.new(:x, :y) do
  def north
    Position.new(x, y+1)
  end

  def south
    Position.new(x, y-1)
  end

  def east
    Position.new(x+1, y)
  end

  def west
    Position.new(x-1, y)
  end

  def to_s
    "#{x},#{y}"
  end
end
