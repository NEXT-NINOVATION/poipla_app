import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class PlayerScore extends PositionComponent {
  final Player player;
  final Camera camera;

  PlayerScore({
    required this.player,
    required this.camera,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  }) {
    positionType = PositionType.viewport;
  }

  @override
  Future<void> render(Canvas canvas) async {
    // final spriteA = await Sprite.load('plastic_A.png');
    // final spriteB = await Sprite.load('plastic_B.png');
    // final spriteC = await Sprite.load('plastic_C.png');
    final scoreBar = await Sprite.load('score_bar.png');

    final double frameWidth = camera.gameSize.x;

    add(SpriteComponent(
      sprite: scoreBar,
      size: Vector2(300, 68),
      position: Vector2(frameWidth - 300, 90),
    ));

    // スコアの横にプラスチックを表示
    // add(SpriteComponent(
    //     sprite: spriteA,
    //     size: Vector2.all(55.0),
    //     position: Vector2(frameWidth + -140, 87),
    //     priority: 4));
    // add(SpriteComponent(
    //   sprite: spriteB,
    //   size: Vector2.all(55.0),
    //   position: Vector2(frameWidth + 80, 87),
    // ));
    // add(SpriteComponent(
    //   sprite: spriteC,
    //   size: Vector2.all(55.0),
    //   position: Vector2(frameWidth + 20, 87),
    // ));
  }

  void reset() {
    removeFromParent();
  }
}
