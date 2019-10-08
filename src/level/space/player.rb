module Level
  module Space

    class Player
      attr_reader :body

      def initialize(body)
        @body = body
      end

      def push_up
        Player.new(@body.push_up(thrust))
      end

      def push_right
        Player.new(@body.push_right(thrust))
      end

      def push_down
        Player.new(@body.push_down(thrust))
      end

      def push_left
        Player.new(@body.push_left(thrust))
      end

      def stop
        Player.new(@body.stop)
      end

      def after(duration, collisions: [])
        Player.new(@body.after(duration, collisions: collisions))
      end

      private

      def thrust
        200
      end
    end

  end
end
