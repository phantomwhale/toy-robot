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
