import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'player.dart';

class HealthBar extends PositionComponent {
  final Player player;

  HealthBar({
    required this.player,
    position,
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
    // 右上隅に長方形のヘルスバーを描画。
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(300, 0, 250, 70),
        const Radius.circular(10),
      ),
      Paint()..color = const Color(0xFFFFA63E),
    );
    super.render(canvas);

    final healthAvailable = await Sprite.load('health_available.png');
    final healthUnavailable = await Sprite.load('health_unavailable.png');
    final position = [330, 390, 450];

    for (int i = 0; i <= 2; i++) {
      if (player.health[i] == true) {
        add(SpriteComponent(
          sprite: healthAvailable,
          size: Vector2.all(60.0),
          position: Vector2(size.x + position[i], 8),
        ));
      } else {
        add(SpriteComponent(
          sprite: healthUnavailable,
          size: Vector2.all(60.0),
          position: Vector2(size.x + position[i], 8),
        ));
      }
    }
  }
}
