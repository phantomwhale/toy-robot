class Robot
  TABLE_SIZE = 5
  attr_reader :x, :y, :facing

  def place(x, y, facing)
    @x = x.to_i
    @y = y.to_i
    @facing = facing.to_s
  end

  def move
    case @facing 
    when 'NORTH'
      @y = [@y + 1, TABLE_SIZE-1].min
    when 'SOUTH'
      @y = [@y - 1, 0].max
    when 'EAST'
      @x = [@x + 1, TABLE_SIZE-1].min
    when 'WEST'
      @x = [@x - 1, 0].max
    end
  end

  def left
    case @facing 
    when 'NORTH'
      @facing = 'WEST'
    when 'SOUTH'
      @facing = 'EAST'
    when 'EAST'
      @facing = 'NORTH'
    when 'WEST'
      @facing = 'SOUTH'
    end
  end

  def right
    case @facing 
    when 'NORTH'
      @facing = 'EAST'
    when 'SOUTH'
      @facing = 'WEST'
    when 'EAST'
      @facing = 'SOUTH'
    when 'WEST'
      @facing = 'NORTH'
    end
  end

  def placed?
    !(@x.nil? && @y.nil?)
  end
end
