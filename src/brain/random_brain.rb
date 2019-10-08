require 'brain/decision'
require 'timing/timer'

module Brain

  class RandomBrain
    attr_reader :decision

    def self.make(duration)
      RandomBrain.new(Timing::Timer.new(0, duration), nil)
    end

    def initialize(timer, decision)
      @timer = timer
      @decision = decision
    end

    def decide(now)
      if @timer.expired?(now)
        left = false
        right = false
        up = false
        down = false

        n = rand
        if n < 0.1
          right = true
        elsif n < 0.3
          up = true
        elsif n < 0.6
          down = true
        else
          left = true
        end

        decision = Decision.new(
          up: up,
          down: down,
          left: left,
          right: right
        )

        RandomBrain.new(@timer.reset(now), decision)
      else
        self
      end
    end
  end

end
