require 'gosu'
require 'window/keystate'

module Window

  class GosuKeystateReader
    def initialize(window)
      @window = window
    end

    def keystate
      Keystate.new(
        up: @window.button_down?(Gosu::KB_UP),
        down: @window.button_down?(Gosu::KB_DOWN),
        left: @window.button_down?(Gosu::KB_LEFT),
        right: @window.button_down?(Gosu::KB_RIGHT),
        enter: @window.button_down?(Gosu::KB_RETURN),
      )
    end

  end

end
