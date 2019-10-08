require 'physics/vector'

module Physics

  class Body
    attr_reader :rectangle, :vector

    def self.make_stationary(rectangle)
      Body.new(rectangle, Vector.zero)
    end

    def initialize(rectangle, vector)
      @rectangle = rectangle
      @vector = vector
    end

    def after(duration, collisions: [])
      vx = @vector.x
      vy = @vector.y

      collisions.each do |collision|
        if collision.interval.start <= duration
          vx = 0.0 if collision.x_axis?
          vy = 0.0 if collision.y_axis?
        end
      end

      rectangle = @rectangle.move(vx * duration, vy * duration)
      Body.new(rectangle, @vector)
    end

    def push(vector)
      Body.new(@rectangle, @vector.add(vector))
    end

    def push_up(magnitude)
      push(Vector.up(magnitude))
    end

    def push_right(magnitude)
      push(Vector.right(magnitude))
    end

    def push_down(magnitude)
      push(Vector.down(magnitude))
    end

    def push_left(magnitude)
      push(Vector.left(magnitude))
    end

    def stop
      Body.new(@rectangle, Vector.zero)
    end
  end

end
