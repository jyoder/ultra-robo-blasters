require 'geometry/dimensions'
require 'geometry/point'

module Geometry

  class Rectangle
    attr_reader :point, :dimensions

    def self.make(x, y, width, height)
      Rectangle.new(Point.new(x, y), Dimensions.new(width, height))
    end

    def initialize(point, dimensions)
      @point = point
      @dimensions = dimensions
    end

    def x_1
      @point.x
    end

    def y_1
      @point.y
    end

    def x_2
      x_1 + @dimensions.width
    end

    def y_2
      y_1 + @dimensions.height
    end

    def move(dist_x, dist_y)
      Rectangle.new(@point.move(dist_x, dist_y), dimensions)
    end

    def intersect(rectangle)
      x_1 = [x_1, rectangle.x_1].max
      x_2 = [x_2, rectangle.x_2].min
      y_1 = [y_1, rectangle.y_1].max
      y_2 = [y_2, rectangle.y_2].min

      Rectangle.make(x_1, y_1, x_2 - x_1, y_2 - y_1)
    end

    def contains?(rectangle)
      x_1 <= rectangle.x_1 &&
      y_1 <= rectangle.y_1 &&
      x_2 >= rectangle.x_2 &&
      y_2 >= rectangle.y_2
    end
  end

end
