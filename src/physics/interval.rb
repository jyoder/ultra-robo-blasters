module Physics

  class Interval
    attr_reader :start, :stop

    def initialize(start, stop)
      @start = start
      @stop = stop
    end

    def intersection(interval)
      start = [@start, interval.start].max
      stop = [@stop, interval.stop].min
      start <= stop ? Interval.new(start, stop) : nil
    end
  end

end
