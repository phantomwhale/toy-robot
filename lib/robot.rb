class Robot
  TABLE_SIZE = 5
  FACINGS = %w(NORTH EAST SOUTH WEST)

  attr_reader :x, :y, :facing

  def place(x, y, facing)
    change_position(x.to_i, y.to_i)
    @facing = facing.to_s
  end

  def move
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

  def placed?
    !(@x.nil? && @y.nil?)
  end

  private

  def turn(adjustment)
    index = FACINGS.index(@facing)
    @facing = FACINGS.rotate(adjustment)[index]
  end

  def change_position(x, y) 
    if on_table(x, y)  
      @x = x.to_i
      @y = y.to_i
    end
  end

  def on_table(x, y) 
    0 <= x && x <= 4 && 0 <= y && y <= 4
  end
end

