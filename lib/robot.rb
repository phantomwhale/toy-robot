class Robot
  TABLE_SIZE = 5
  FACINGS = %w(NORTH EAST SOUTH WEST)

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
end

