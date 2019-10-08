require 'geometry/point'
require 'geometry/rectangle'
require 'physics/interval'

module Physics

  class Collision
    def self.find(body_1, body_2)
      interval_x = _collision_interval(
        body_1.rectangle.x_1,
        body_1.rectangle.x_2,
        body_1.vector.x,
        body_2.rectangle.x_1,
        body_2.rectangle.x_2,
        body_2.vector.x
      )
      return nil if interval_x.nil?

      interval_y = _collision_interval(
        body_1.rectangle.y_1,
        body_1.rectangle.y_2,
        body_1.vector.y,
        body_2.rectangle.y_1,
        body_2.rectangle.y_2,
        body_2.vector.y
      )
      return nil if interval_y.nil?

      interval = interval_x.intersection(interval_y)
      return nil if interval.nil?

      Collision.new(body_1, body_2, interval, interval_x, interval_y)
    end

    def self._collision_interval(a_1, a_2, v_a, b_1, b_2, v_b)
      t_1 = _collision_time(a_2, v_a, b_1, v_b)
      t_2 = _collision_time(a_1, v_a, b_2, v_b)

      start, stop = t_1 < t_2 ? [t_1, t_2] : [t_2, t_1]
      return nil if start == Float::INFINITY

      if start >= 0.0 && stop >= 0.0
        Interval.new(start, stop)
      elsif start < 0.0 && stop >= 0.0
        Interval.new(0.0, stop)
      else
        nil
      end
    end

    def self._collision_time(location_1, velocity_1, location_2, velocity_2)
      distance = location_1 - location_2
      velocity_delta = velocity_2 - velocity_1
      distance / velocity_delta.to_f
    end

    attr_reader :body_1, :body_2, :interval, :interval_x, :interval_y

    def initialize(body_1, body_2, interval, interval_x, interval_y)
      @body_1 = body_1
      @body_2 = body_2
      @interval = interval
      @interval_x = interval_x
      @interval_y = interval_y
    end

    def x_axis?
      @interval_x.start > 0.0
    end

    def y_axis?
      @interval_y.start > 0.0
    end
  end

end
