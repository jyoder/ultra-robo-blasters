require 'game/game'
require 'game/renderer'
require 'level/space/factory'

module Game

  class Factory
    def initialize
      @space_factory = Level::Space::Factory.new
    end

    def game(dimensions)
      Game.new(0, @space_factory.level(dimensions))
    end

    def renderer
      Renderer.new(@space_factory.renderer)
    end
  end

end
