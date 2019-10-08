require 'gosu'

module Window

  class Window < Gosu::Window
    attr_writer :update, :draw

    def initialize(width, height)
      @update = -> {}
      @draw = -> {}

      super(width, height)
    end

    def update
      @update.call
    end

    def draw
      @draw.call
    end
  end

end
