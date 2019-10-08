module Brain

  class DecisionScriptBuilder
    attr_reader :script

    def initialize
      @script = []
    end

    def left(delay)
      _add_decision(delay, Decision.new(left: true, right: false, up: false, down: false))
      self
    end

    def right(delay)
      _add_decision(delay, Decision.new(left: false, right: true, up: false, down: false))
      self
    end

    def up(delay)
      _add_decision(delay, Decision.new(left: false, right: false, up: true, down: false))
      self
    end

    def down(delay)
      _add_decision(delay, Decision.new(left: false, right: false, up: false, down: true))
      self
    end

    private

    def _add_decision(delay, decision)
      @script << [delay, decision]
    end
  end

end
