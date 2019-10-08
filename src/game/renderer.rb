require 'gosu'

module Game

  class Renderer
    def initialize(space_level_renderer)
      @space_level_renderer = space_level_renderer
    end

    def render(context, game)
      Gosu.draw_rect(0, 0, context.width, context.height, Gosu::Color::WHITE)
      @space_level_renderer.render(context, game.current_level)
    end
  end

end
