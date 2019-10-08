module Game

  class Game
    attr_reader :version, :current_level

    def initialize(version, current_level)
      @version = version
      @current_level = current_level
    end

    def update(now, keystate)
      Game.new(@version + 1, @current_level.update(now, keystate))
    end
  end

end
