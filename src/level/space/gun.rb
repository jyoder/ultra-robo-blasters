require 'geometry/rectangle'
require 'physics/body'
require 'timing/timer'

module Level
  module Space

    class Gun
      attr_reader :fired

      def self.make(sound)
        Gun.new(Timing::Timer.new(0, 0.1), nil, sound)
      end

      def initialize(timer, fired, sound)
        @timer = timer
        @fired = fired
        @sound = sound
      end

      def fire(now, point)
        if @timer.expired?(now)
          @sound.play
          Gun.new(@timer.reset(now), _make_bullet(point), @sound)
        else
          Gun.new(@timer, nil, @sound)
        end
      end

      private

      def _make_bullet(point)
        Physics::Body.make_stationary(
          Geometry::Rectangle.make(point.x, point.y, _bullet_width, _bullet_height)
        ).push_right(_bullet_thrust)
      end

      def _bullet_width
        15
      end

      def _bullet_height
        3
      end

      def _bullet_thrust
        1000
      end
    end

  end
end
