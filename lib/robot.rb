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
    case @facing 
    when 'NORTH'
      change_position(Position.new(@position.x, @position.y+1))
    when 'SOUTH'
      change_position(Position.new(@position.x, @position.y-1))
    when 'EAST'
      change_position(Position.new(@position.x+1, @position.y))
    when 'WEST'
      change_position(Position.new(@position.x-1, @position.y))
    end
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def location 
    "#{@position.x},#{@position.y},#{@facing}" if placed?
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

Position = Struct.new(:x, :y)
