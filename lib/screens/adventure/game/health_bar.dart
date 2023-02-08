import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'player.dart';

class HealthBar extends PositionComponent {
  final Player player;
  final Camera camera;

  HealthBar({
    required this.player,
    required this.camera,
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

  bool isFirst = true;
  int maxHealth = 0;
  List positionList = [];
  Vector2 healthBarSize = Vector2(1, 68);
  double heartSize = 60.0;
  // double heart = 60.0;

  @override
  Future<void> render(Canvas canvas) async {
    // 右上隅に長方形のヘルスバーを描画。
    // canvas.drawRRect(
    //   RRect.fromRectAndRadius(
    //     const Rect.fromLTWH(300, 0, 250, 70),
    //     const Radius.circular(10),
    //   ),
    //   Paint()..color = const Color(0xFFFFA63E),
    // );
    // super.render(canvas);

    if (isFirst == true) {
      maxHealth = player.health.length;
      isFirst = false;
    }
    final healthAvailable = await Sprite.load('health_available.png');
    final healthUnavailable = await Sprite.load('health_unavailable.png');
    final healthBar = await Sprite.load('health_bar.png');

    final double frameWidth = camera.gameSize.x;
    final double healthBarWidth = (heartSize + 20) * player.health.length;
    final double startPosition =
        (healthBarWidth / 2) + ((heartSize * player.health.length) / 2);

    add(SpriteComponent(
      sprite: healthBar,
      size: Vector2(healthBarWidth, 68),
      position: Vector2(frameWidth - healthBarWidth, 6),
    ));

    for (int i = 0; i < maxHealth; i++) {
      if (player.health[i] == true) {
        add(SpriteComponent(
          sprite: healthAvailable,
          size: Vector2.all(heartSize),
          position: Vector2(frameWidth - startPosition + (heartSize * i), 8),
        ));
      } else {
        add(SpriteComponent(
          sprite: healthUnavailable,
          size: Vector2.all(heartSize),
          position: Vector2(frameWidth - startPosition + (heartSize * i), 8),
        ));
      }
    }
  }

  void reset() {
    removeFromParent();
  }
}
