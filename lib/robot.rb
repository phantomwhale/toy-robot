class Robot
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :x, :y, :facing

  def initialize(table = Table.new)
    @table = table
  end

  def place(x, y, facing)
    change_position(x.to_i, y.to_i)
    @facing = facing.to_s
  end

  def move
    return unless placed?
    case @facing 
    when 'NORTH'
      change_position(@x, @y+1)
    when 'SOUTH'
      change_position(@x, @y-1)
    when 'EAST'
      change_position(@x+1, @y)
    when 'WEST'
      change_position(@x-1, @y)
    end
  end

  def left
    turn(-1)
  end

  def right
    turn(1)
  end

  def position 
    "#{@x},#{@y},#{@facing}" if placed?
  end

  def placed?
    !(@x.nil? && @y.nil?)
  end

  private

  def turn(adjustment)
    return unless placed?
    index = FACINGS.index(@facing)
    @facing = FACINGS.rotate(adjustment)[index]
  end

  def change_position(x, y) 
    if @table.within_edges?(x, y)  
      @x = x.to_i
      @y = y.to_i
    end
  end
end

class Table
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def within_edges?(x, y)
     within_width?(x) && within_height?(y)
  end

  private

  def within_width?(x)
    0 <= x && x <= @width-1
  end

  def within_height?(y)
    0 <= y && y <= @height-1
  end
end
