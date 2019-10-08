require 'brain/decision'
require 'timing/timer'

module Brain

  class ScriptedBrain
    attr_reader :decision

    def self.make(script)
      ScriptedBrain.new(Timing::Timer.new(0, 0), script, nil)
    end

    def initialize(timer, script, decision)
      @timer = timer
      @script = script
      @decision = decision
    end

    def decide(now)
      if @script.length > 0 && @timer.expired?(now)
        script = @script.dup
        delay, decision = script.shift
        ScriptedBrain.new(Timing::Timer.new(now, delay), script, decision)
      else
        self
      end
    end
  end

end
