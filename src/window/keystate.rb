module Window

  class Keystate
    attr_reader :up, :down, :left, :right, :enter

    def initialize(up:, down:, left:, right:, enter:)
      @up = up
      @down = down
      @left = left
      @right = right
      @enter = enter
    end
  end

end
