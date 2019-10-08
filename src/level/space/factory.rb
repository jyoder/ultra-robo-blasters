require 'assets/assets_path'
require 'brain/decision_script_builder'
require 'brain/random_brain'
require 'geometry/rectangle'
require 'level/space/boundaries'
require 'level/space/enemy'
require 'level/space/gun'
require 'level/space/level'
require 'level/space/player'
require 'level/space/renderer'
require 'physics/body'
require 'gosu'

module Level
  module Space

    class Factory
      def level(dimensions)
        Level.new(_player, _enemy, _player_gun, [], _boundaries(dimensions), 0)
      end

      def renderer
        player_image = Gosu::Image.new(Assets::AssetsPath.path_to('rocket-side.png'))
        enemy_image = Gosu::Image.new(Assets::AssetsPath.path_to('enemy.png'))
        Renderer.new(player_image, enemy_image)
      end

      private

      def _player
        Player.new(_player_body)
      end

      def _enemy
        Enemy.make(_enemy_brain, _enemy_body)
      end

      def _player_body
        Physics::Body.make_stationary(Geometry::Rectangle.make(20, 100, 200, 48))
      end

      def _enemy_brain
        Brain::RandomBrain.make(0.1)
      end

      def _enemy_body
        Physics::Body.make_stationary(Geometry::Rectangle.make(300, 100, 50, 83))
      end

      def _player_gun
        Gun.make(Gosu::Sample.new(Assets::AssetsPath.path_to('laser.m4a')))
      end

      def _boundaries(dimensions)
          Boundaries.new(
            left: Physics::Body.make_stationary(Geometry::Rectangle.make(0, 0, 1, dimensions.height)),
            right: Physics::Body.make_stationary(Geometry::Rectangle.make(dimensions.width, 0, 1, dimensions.height)),
            top: Physics::Body.make_stationary(Geometry::Rectangle.make(0, 0, dimensions.width, 1)),
            bottom: Physics::Body.make_stationary(Geometry::Rectangle.make(0, dimensions.height, dimensions.width, 1))
          )
      end
    end

  end
end
