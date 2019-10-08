module Timing

  class Timer
    def initialize(now, duration)
      @started_at = now
      @duration = duration
    end

    def expired?(now)
      _expires_at <= now
    end

    def reset(now)
      Timer.new(now, @duration)
    end

    private

    def _expires_at
      @started_at + @duration
    end
  end

end
