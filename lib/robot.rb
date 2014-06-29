class Robot
  attr_reader :x, :y, :facing

  def place(x, y, facing)
    @x = x
    @y = y
    @facing = facing
  end
end
