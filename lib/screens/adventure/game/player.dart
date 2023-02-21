import 'dart:io';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/effects.dart';
import 'package:flame/particles.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/plastic.dart';
import 'package:provider/provider.dart';

import 'game.dart';
import 'obstacle.dart';
import 'command.dart';
import 'knows_game_size.dart';
import 'audio_player_component.dart';

// This component class represents the player character in game.
class Player extends SpriteComponent
    with
        KnowsGameSize,
        CollisionCallbacks,
        HasGameRef<AdventureGame>,
        KeyboardHandler {
  // ジョイスティック
  JoystickComponent joystick;

  bool hitByObstacle = false;

  // 現在の魚の詳細
  Fish _fish;

  // 現在の魚の種類
  FishType fishType;

  // 残りライフ
  List health;
  int hIndex;

  // お金を変更できるようにするための PlayerData への参照
  late PlayerData _playerData;
  int get score => _playerData.currentScore;

  late AudioPlayerComponent _audioPlayerComponent;

  // 生成した乱数を保持する。
  final _random = Random();

  // このメソッドは、x成分が [-100 ～ 100] の範囲にあり、
  // y成分が [200, 400] の範囲にあるようなランダムなベクトルを生成します。
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2(0.5, -1)) * 200;
  }

  Player({
    required this.joystick,
    required this.fishType,
    required this.health,
    required this.hIndex,
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
  })  : _fish = Fish.getFishByType(fishType),
        super(sprite: sprite, position: position, size: size) {
    // 複数弾モードの持続時間を4秒に設定しています。
    // 4秒後に複数弾モードfalseになります。
    // _powerUpTimer = Timer(4, onTick: () {
    //   _shootMultipleBullets = false;
    // });
  }

  @override
  void onMount() {
    super.onMount();

    _audioPlayerComponent = AudioPlayerComponent();
    add(_audioPlayerComponent);

    // コンポーネントサイズの最小寸法の0.8倍の半径を持つ円形をヒットボックスとして追加する。
    final shape = CircleHitbox.relative(
      0.8,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);

    _playerData = Provider.of<PlayerData>(gameRef.buildContext!, listen: false);
  }

  // 当たり判定
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // 他のエンティティが敵の場合、体力を1減らす。
    if (other is Obstacle && !hitByObstacle) {
      // gameRef.addCommand(Command<AudioPlayerComponent>(action: (audioPlayer) {
      //   audioPlayer.playHitObstacleSfx();
      // }));
      // 画面を揺らす処理
      gameRef.camera.shake(intensity: 20);

      // ライフが残っていたら配列から要素を一つ減らす。
      if (health.indexOf(true) == 0) {
        hit(hIndex);
        health[hIndex] = false;
        hIndex -= 1;
      }
    } else if (other is Plastic) {
      // gameRef.addCommand(Command<AudioPlayerComponent>(action: (audioPlayer) {
      //   audioPlayer.playGetPlaSfx();
      // }));
      _playerData.currentScore += 1;
    }
  }

  void hit(int hIndex) {
    if (!hitByObstacle) {
      hitByObstacle = true;
    }
    if (hIndex != 0) {
      add(
        OpacityEffect.fadeOut(
          EffectController(
            alternate: true,
            duration: 0.1,
            repeatCount: 10,
          ),
        )..onComplete = () {
            hitByObstacle = false;
          },
      );
    } else {
      add(
        OpacityEffect.fadeOut(
          EffectController(
            alternate: true,
            duration: 0.1,
            repeatCount: 2,
          ),
        )..onComplete = () {
            hitByObstacle = false;
          },
      );
    }
  }

  Vector2 keyboardDelta = Vector2.zero();
  static final _keysWatched = {
    LogicalKeyboardKey.keyW,
    LogicalKeyboardKey.keyA,
    LogicalKeyboardKey.keyS,
    LogicalKeyboardKey.keyD,
    LogicalKeyboardKey.space,
  };

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    // 最初にこれをゼロに設定します。
    // ユーザーが押したすべてのキーを離すと、セットは空になりベクトルはゼロではなくなります。
    keyboardDelta.setZero();

    if (!_keysWatched.contains(event.logicalKey)) return true;

    if (event is RawKeyDownEvent &&
        !event.repeat &&
        event.logicalKey == LogicalKeyboardKey.space) {
      // pew pew!
      joystickAction();
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      keyboardDelta.y = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      keyboardDelta.x = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      keyboardDelta.y = 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      keyboardDelta.x = 1;
    }

    // 処理されたキーボード入力
    return false;
  }

  // フレームごとにゲームクラスによって呼び出されるメソッド。
  @override
  void update(double dt) {
    super.update(dt);

    // moveDirection に沿って、プレーヤーの現在の位置を (速度 * デルタ時間) だけ
    // インクリメントします。デルタ時間は、最後の更新からの経過時間です。
    // フレームレートが高いデバイスの場合、デルタ時間は小さくなり、フレームレートが
    // 低いデバイスの場合は大きくなります。速度にデルタ時間を掛けることで、デバイスの
    // FPSに関係なく、プレーヤーの速度を一定に保つことができます。
    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * _fish.speed * dt);
    }

    if (!keyboardDelta.isZero()) {
      position.add(keyboardDelta * _fish.speed * dt);
    }

    // プレイヤースプライトが画面サイズの外に出ないように、プレイヤーの位置を固定します。
    position.clamp(
      Vector2.zero() + size / 2,
      gameRef.size - size / 2,
    );

    // Adds thruster particles.(クラスター粒子を追加？)
    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 10,
        lifespan: 0.1,
        generator: (i) => AcceleratedParticle(
          acceleration: getRandomVector(),
          speed: getRandomVector(),
          position: (position.clone() + Vector2(0, size.y / 3)),
          child: CircleParticle(
            radius: 1,
            paint: Paint()..color = Colors.white,
          ),
        ),
      ),
    );

    gameRef.add(particleComponent);
  }

  void joystickAction() {
    // Bullet bullet = Bullet(
    //   sprite: gameRef.spriteSheet.getSpriteById(28),
    //   size: Vector2(64, 64),
    //   position: position.clone(),
    //   level: fish.level,
    // );

    // 中央に固定し、ゲームに追加します。
    // bullet.anchor = Anchor.center;
    // gameRef.add(bullet);

    // 弾の発射効果を再生するようにオーディオプレーヤーに依頼する。
    gameRef.addCommand(Command<AudioPlayerComponent>(action: (audioPlayer) {
      audioPlayer.playSfx('laserSmall_001.ogg');
    }));
  }

  // 与えられたポイントをプレイヤーのスコアに追加し、[PlayerData.money] にも追加する。
  void addToScore(int points) {
    _playerData.currentScore += points;
    _playerData.money += points;

    // プレーヤーデータをディスクに保存します。
    _playerData.save();
  }

  // プレイヤーのスコア、ヘルス、位置をリセットします。
  // ゲームの再起動中および終了中に呼び出す必要があります。
  void reset() {
    _playerData.currentScore = 0;
    health = [];
    hIndex = 0;
    position = gameRef.size / 2;
  }

  // 指定されたさかなタイプで現在のさかなタイプを変更します。
  // このメソッドは、さかなのスプライトだけでなく、内部のさかなの詳細も更新します。
  void setFishType(FishType fishType) {
    fishType = fishType;
    _fish = Fish.getFishByType(fishType);
    sprite = gameRef.spriteSheet.getSpriteById(_fish.spriteId);

    for (int i = 0; i < _fish.health; i++) {
      health.add(true);
    }
    hIndex = _fish.health - 1;
  }
}
