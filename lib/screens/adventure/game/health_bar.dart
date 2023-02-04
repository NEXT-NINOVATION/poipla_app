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

  bool isFirst = true;
  int maxHealth = 0;
  List positionList = [];

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

    if (isFirst == true) {
      maxHealth = player.hIndex;
      positionList = [330, 390, 450, 510];
      isFirst = false;
    }
    final healthAvailable = await Sprite.load('health_available.png');
    final healthUnavailable = await Sprite.load('health_unavailable.png');

    print(player.hIndex);

    for (int i = 0; i <= maxHealth; i++) {
      if (player.health[i] == true) {
        add(SpriteComponent(
          sprite: healthAvailable,
          size: Vector2.all(60.0),
          position: Vector2(size.x + positionList[i], 8),
        ));
      } else {
        print(player.health);
        add(SpriteComponent(
          sprite: healthUnavailable,
          size: Vector2.all(60.0),
          position: Vector2(size.x + positionList[i], 8),
        ));
      }
    }
  }

  void reset() {
    removeFromParent();
  }
}
