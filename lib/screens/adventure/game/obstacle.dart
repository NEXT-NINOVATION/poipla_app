import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/particles.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/models/object_data.dart';

import 'game.dart';
import 'player.dart';
import 'command.dart';
import 'knows_game_size.dart';
import 'audio_player_component.dart';

// 敵のコンポーネント
class Obstacle extends SpriteComponent
    with KnowsGameSize, CollisionCallbacks, HasGameRef<AdventureGame> {
  // 敵のスピード
  double _speed = 250;

  // 敵が移動する方向。
  // デフォルトは垂直下向き。
  Vector2 moveDirection = Vector2(0, 1);

  // 敵がフリーズする時間を制御する。
  late Timer _freezeTimer;

  // 乱数を生成するRandomクラスのオブジェクトを保持する。
  final _random = Random();

  // 敵を作成するために必要なデータ。(models/enemy_data.dart参照)
  final ObstacleData obstacleData;

  // このメソッドは、角度が0～360度のランダムなベクトルを生成します。
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2.random(_random)) * 500;
  }

  // +ve y軸に対してわずかな角度を持つランダムな方向ベクトルを返します。
  Vector2 getRandomDirection() {
    return (Vector2.random(_random) - Vector2(0.5, -1)).normalized();
  }

  Obstacle({
    required Sprite? sprite,
    required this.obstacleData,
    required Vector2? position,
    required Vector2? size,
  }) : super(sprite: sprite, position: position, size: size) {
    // obstacleDataから現在の速度を設定します。
    _speed = obstacleData.speed;

    // 敵データからヒットポイントを正しい値に設定します。
    // _hitPoints = enemyData.level * 10;

    // フリーズ時間を2秒に設定します。2秒後に速度がリセットされます。
    _freezeTimer = Timer(2, onTick: () {
      _speed = obstacleData.speed;
    });

    // 敵が水平に移動できる場合、移動方向をランダム化します。
    if (obstacleData.hMove) {
      moveDirection = getRandomDirection();
    }
  }

  @override
  void onMount() {
    super.onMount();

    // このコンポーネントサイズの最小寸法の0.8倍の半径を持つ円形の
    // ヒットボックスを追加します。
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is Player) {
      // destroy();
    }
  }

  // 敵を破壊する時に呼ばれるメソッド。
  void destroy() {
    // オーディオプレーヤーに敵の破壊効果を再生するように依頼する。
    // gameRef.addCommand(Command<AudioPlayerComponent>(action: (audioPlayer) {
    //   audioPlayer.playSfx('laser1.ogg');
    // }));

    removeFromParent();

    // 死ぬ前に、プレイヤーのスコアを1増やすコマンドを登録します。
    final command = Command<Player>(action: (player) {
      // 正しいkillPointを使用して、プレーヤーのスコアを増やします。
      player.addToScore(obstacleData.point);
    });
    gameRef.addCommand(command);

    // 敵の現在の位置に、ランダムな速度と加速度で20個の白い円のパーティクルを生成します。
    // 各パーティクルは正確に0.1秒間存続し、その後ゲームの世界から削除されます。
    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 20,
        lifespan: 0.1,
        generator: (i) => AcceleratedParticle(
          acceleration: getRandomVector(),
          speed: getRandomVector(),
          position: position.clone(),
          child: CircleParticle(
            radius: 2,
            paint: Paint()..color = Colors.white,
          ),
        ),
      ),
    );

    gameRef.add(particleComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // テキストコンポーネントとhitPointsの値を同期します。
    // _hpText.text = '$_hitPoints HP';

    // ヒットポイントがゼロになった場合、障害物を撃破する。
    // if (_hitPoints <= 0) {
    //   destroy();
    // }

    _freezeTimer.update(dt);

    // 速度とデルタ時間を使用して、この敵の位置を更新
    position += moveDirection * _speed * dt;

    // 敵が画面外に出たら破壊する。
    if (position.y > gameRef.size.y) {
      removeFromParent();
    } else if ((position.x < size.x / 2) ||
        (position.x > (gameRef.size.x - size.x / 2))) {
      // 敵が垂直方向のスクリーンの境界の外に出ようとしている場合、
      // そのx方向を反転させます。
      moveDirection.x *= -1;
    }
  }

  // 呼び出された敵を2秒間一時停止させます。
  void freeze() {
    _speed = 0;
    _freezeTimer.stop();
    _freezeTimer.start();
  }
}
