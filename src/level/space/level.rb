require 'geometry/point'
require 'physics/collision'

module Level
  module Space

    class Level
      attr_reader :player, :enemy, :bullets

      def initialize(player, enemy, gun, bullets, boundaries, time)
        @player = player
        @enemy = enemy
        @gun = gun
        @bullets = bullets
        @boundaries = boundaries
        @time = time
      end

      def update(now, keystate)
        player = _update_player(now)
        player = _push_player(keystate, player)
        bullets = _update_bullets(now)
        gun = _fire_gun(now, keystate, player, @gun, bullets)
        bullets = _remove_enemy_hits(bullets)
        enemy = @enemy.update(now)

        Level.new(player, enemy, gun, bullets, @boundaries, now)
      end

      private

      def _update_player(now)
        @player.after(_elapsed(now), collisions: _collisions).stop
      end

      def _update_enemy(now)
        @player.after(_elapsed(now), collisions: _collisions).stop
      end

      def _update_bullets(now)
        bullets = @bullets.map { |bullet| bullet.after(_elapsed(now)) }
        bullets.select do |bullet|
          bullet.rectangle.x_1 <= @boundaries.right.rectangle.x_2
        end
      end

      def _push_player(keystate, player)
        if keystate.up
          player = player.push_up
        end
        if keystate.down
          player = player.push_down
        end
        if keystate.left
          player = player.push_left
        end
        if keystate.right
          player = player.push_right
        end

        player
      end

      def _fire_gun(now, keystate, player, gun, bullets)
        if keystate.enter
          r = player.body.rectangle
          gun = gun.fire(now, Geometry::Point.new(r.x_2, r.y_1 + r.dimensions.height / 2.0))
          bullets << gun.fired if gun.fired
        end

        gun
      end

      def _elapsed(now)
        @time == 0 ? 0 : now - @time
      end

      def _collisions
        @boundaries.all.map do |boundary|
          Physics::Collision.find(@player.body, boundary)
        end.compact
      end

      def _remove_enemy_hits(bullets)
        bullets.select do |bullet|
          collision = Physics::Collision.find(@enemy.body, bullet)
          !collision || collision.interval.start > 0.0
        end.compact
      end
    end

  end
end
