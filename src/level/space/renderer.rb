require 'gosu'

module Level
  module Space

    class Renderer
      def initialize(player_image, enemy_image)
        @player_image = player_image
        @enemy_image = enemy_image
      end

      def render(context, level)
        _render_player(level.player)
        _render_enemy(level.enemy)
        _render_bullets(level.bullets)
      end

      private

      def _render_player(player)
        r = player.body.rectangle
        @player_image.draw(r.point.x, r.point.y, 1)
      end

      def _render_enemy(enemy)
        r = enemy.body.rectangle
        @enemy_image.draw(r.point.x, r.point.y, 1)
      end

      def _render_bullets(bullets)
        bullets.each do |bullet|
          r = bullet.rectangle
          Gosu::draw_rect(r.point.x, r.point.y, r.dimensions.width, r.dimensions.height, Gosu::Color::BLUE)
        end
      end
    end

  end
end
