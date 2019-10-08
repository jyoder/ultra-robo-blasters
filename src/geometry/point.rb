module Geometry

  class Point
    attr_reader :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def move(dist_x, dist_y)
      Point.new(@x + dist_x, @y + dist_y)
    end
  end

end
