require 'game/factory'
require 'geometry/dimensions'
require 'window/gosu_keystate_reader'
require 'window/window'

module Window

  class Factory
    def window
      dimensions = Geometry::Dimensions.new(640, 480)
      window = Window.new(dimensions.width, dimensions.height)
      window.caption = 'Ultra Robo Blasters'

      game_factory = Game::Factory.new
      game = game_factory.game(dimensions)
      reader = GosuKeystateReader.new(window)
      window.update =  -> { game = game.update(Time.now.to_f, reader.keystate) }

      renderer = game_factory.renderer
      window.draw = -> { renderer.render(window, game) }

      window
    end
  end

end
