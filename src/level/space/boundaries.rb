module Level
  module Space

    class Boundaries
      attr_reader :left, :right, :top, :bottom

      def initialize(left:, right:, top:, bottom:)
        @left = left
        @right = right
        @top = top
        @bottom = bottom
      end

      def all
        [@left, @right, @top, @bottom]
      end
    end

  end
end
