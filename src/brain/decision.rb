module Brain

  class Decision
    attr_reader :up, :down, :left, :right
    def initialize(
      up:,
      down:,
      left:,
      right:
    )
      @up = up
      @down = down
      @left = left
      @right = right
    end
  end

end
