module Physics

  class Vector
    attr_reader :x, :y

    def self.up(magnitude)
      Vector.new(0, -magnitude)
    end

    def self.right(magnitude)
      Vector.new(magnitude, 0)
    end

    def self.down(magnitude)
      Vector.new(0, magnitude)
    end

    def self.left(magnitude)
      Vector.new(-magnitude, 0)
    end

    def self.zero
      Vector.new(0, 0)
    end

    def initialize(x, y)
      @x = x
      @y = y
    end

    def add(vector)
      Vector.new(@x + vector.x, @y + vector.y)
    end
  end

end
