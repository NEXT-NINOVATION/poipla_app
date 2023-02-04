import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class PlayerScore extends PositionComponent {
  final Player player;

  PlayerScore({
    required this.player,
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
    // 右上隅に長方形のヘルスバーを描画します。
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(10, 80, 300, 70),
        const Radius.circular(10),
      ),
      Paint()..color = const Color(0xFFFFCD4E),
    );
    super.render(canvas);

    final spriteA = await Sprite.load('plastic_A.png');
    final spriteB = await Sprite.load('plastic_B.png');
    final spriteC = await Sprite.load('plastic_C.png');

    // スコアの横にプラスチックを表示
    add(SpriteComponent(
        sprite: spriteA,
        size: Vector2.all(55.0),
        position: Vector2(size.x + 20, 87),
        priority: 4));
    add(SpriteComponent(
      sprite: spriteB,
      size: Vector2.all(55.0),
      position: Vector2(size.x + 80, 87),
    ));
    add(SpriteComponent(
      sprite: spriteC,
      size: Vector2.all(55.0),
      position: Vector2(size.x + 140, 87),
    ));
  }

  void reset() {
    removeFromParent();
  }
}
