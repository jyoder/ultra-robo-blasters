module Level
  module Space

    class Enemy
      attr_reader :brain, :body

      def self.make(brain, body)
        Enemy.new(0, brain, body)
      end

      def initialize(time, brain, body)
        @time = time
        @brain = brain
        @body = body
      end

      def update(now)
        body = @body.after(_elapsed(now)).stop
        brain = @brain.decide(now)
        if brain.decision
          decision = brain.decision
          if decision.up
            body = body.push_up(_thrust)
          end
          if decision.down
            body = body.push_down(_thrust)
          end
          if decision.left
            body = body.push_left(_thrust)
          end
          if decision.right
            body = body.push_right(_thrust)
          end
        end

        Enemy.new(now, brain, body)
      end

      private

      def _elapsed(now)
        now - @time
      end

      def _thrust
        100
      end
    end

  end
end
