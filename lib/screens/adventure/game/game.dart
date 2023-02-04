import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/player_score.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/game_clear_menu.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/pause_button.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/pause_menu.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/start_count_down.dart';
import 'package:provider/provider.dart';

import 'obstacle.dart';
import 'plastic.dart';
import 'health_bar.dart';
import 'player.dart';
import 'command.dart';
import 'obstacle_manager.dart';
import 'plastic_manager.dart';
import 'audio_player_component.dart';

// このクラスはゲームループの初期化と実行を担当する。
class AdventureGame extends FlameGame
    with
        HasDraggables,
        HasTappables,
        HasCollisionDetection,
        HasKeyboardHandlerComponents {
  // これがないとContainerで設定している背景色が反映されない。
  @override
  Color backgroundColor() => const Color.fromARGB(0, 255, 255, 255);

  // プレーヤーコンポーネントへの参照を格納。
  late Player _player;

  // メインスプライトシートへの参照を格納。
  late SpriteSheet spriteSheet;

  // 障害物マネージャーコンポーネントへの参照を格納。
  late ObstacleManager _obstacleManager;

  // プラスチックマネージャーコンポーネントへの参照を格納。
  late PlasticManager _plasticManager;

  // 右上にプレイヤーのスコアを表示。
  late TextComponent _scoreText;
  late PlayerScore _playerScore;

  // 右上にプレイヤーのヘルスを表示。
  // late SpriteComponent _playerHealth;

  // 右上にヘルスバーを表示
  late HealthBar _healthBar;

  // late AudioPlayerComponent _audioPlayerComponent;

  // 現在の更新で処理されるコマンドのリスト。
  final _commandList = List<Command>.empty(growable: true);

  // 次の更新で処理されるコマンドのリスト。
  final _addLaterCommandList = List<Command>.empty(growable: true);

  // ゲームがすでに初期化されていることを示します。
  bool _isAlreadyLoaded = false;

  // スタート前のカウントダウン画面表示用
  bool _isStarted = false;

  // このメソッドは、ゲームループが始まる前に Flame によって呼び出されます。
  // アセットのロードとコンポーネントの追加は、ここで行う必要がある。
  @override
  Future<void> onLoad() async {
    // ウィンドウのサイズに関係なく、ゲームが固定解像度を使用するようにする。
    camera.viewport = FixedResolutionViewport(Vector2(540, 960));

    // ゲームを1回だけ初期化
    if (!_isAlreadyLoaded) {
      // 後で使用するためにすべての画像をロードしてキャッシュする。
      await images.loadAll([
        'poipla_tilesheet@2.png',
        'health_available.png',
        'health_unavailable.png',
      ]);

      // _audioPlayerComponent = AudioPlayerComponent();
      // add(_audioPlayerComponent);

      final bubble = await ParallaxComponent.load(
        [ParallaxImageData('bubble_A.png'), ParallaxImageData('bubble_B.png')],
        repeat: ImageRepeat.repeat,
        baseVelocity: Vector2(0, -50),
        velocityMultiplierDelta: Vector2(0, 1.5),
      );
      add(bubble);

      spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('poipla_tilesheet@2.png'),
        columns: 10,
        rows: 1,
      );

      // 左側に基本的なジョイスティックコンポーネントを作成。
      final joystick = JoystickComponent(
        anchor: Anchor.bottomRight,
        position: Vector2(size.x - 30, size.y - 30),
        // size: 100,
        background: CircleComponent(
          radius: 60,
          paint: Paint()..color = Colors.white.withOpacity(0.5),
        ),
        knob: CircleComponent(radius: 30),
      );
      add(joystick);

      /// onLoad() メソッドではビルドコンテキストが有効でないため、ここでは
      /// 現在の [PlayerData] を取得できません。したがって、デフォルトの
      /// FishType.suu でプレーヤーを初期化。
      const fishType = FishType.sameko;
      final fish = Fish.getFishByType(fishType);

      _player = Player(
        joystick: joystick,
        fishType: fishType,
        sprite: spriteSheet.getSpriteById(fish.spriteId),
        size: Vector2(100, 100),
        position: size / 2,
      );

      // スプライトが中央にあることを確認する。
      _player.anchor = Anchor.center;
      add(_player);

      _obstacleManager = ObstacleManager(spriteSheet: spriteSheet);
      add(_obstacleManager);

      _plasticManager = PlasticManager(spriteSheet: spriteSheet);
      add(_plasticManager);

      _playerScore = PlayerScore(
        player: _player,
        position: Vector2(size.x - 300, 10),
      );

      _playerScore.positionType = PositionType.viewport;

      add(_playerScore);

      // プレーヤースコアのテキストコンポーネントを作成します。
      _scoreText = TextComponent(
        text: '0',
        position: Vector2(size.x - 90, 96),
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Color(0xFFF26957),
            fontSize: 40,
            fontFamily: 'LightNovelPOPv2',
          ),
        ),
      );

      // final subText = TextComponent(
      //   text: '0こ',
      //   position: _scoreText.positionOfAnchor(Anchor.centerRight),
      //   textRenderer: TextPaint(
      //     style: const TextStyle(
      //       color: Color(0xFFF26957),
      //       fontSize: 20,
      //       fontFamily: 'LightNovelPOPv2',
      //     ),
      //   ),
      // );

      // positionTypeをviewportに設定すると、このコンポーネントが
      // カメラの変換の影響を受けないようになる。
      _scoreText.positionType = PositionType.viewport;

      add(_scoreText);
      // add(subText);

      _healthBar = HealthBar(
        player: _player,
        position: Vector2(size.x - 240, 10),
      );

      // positionTypeをviewportに設定すると、このコンポーネントがカメラ
      // の変換の影響を受けないようになります。
      _healthBar.positionType = PositionType.viewport;

      add(_healthBar);

      // trueに設定して、同じセッションで再度初期化しないようにする。
      _isAlreadyLoaded = true;
    }
  }

  // ゲームインスタンスが Flutter のウィジェットツリーにアタッチされると呼び出されます。
  @override
  void onAttach() {
    if (buildContext != null) {
      // リスナーを登録せずに、現在のビルドコンテキストから PlayerData を取得します。
      final playerData = Provider.of<PlayerData>(buildContext!, listen: false);
      // プレーヤーの現在の魚の種類を更新します。
      _player.setFishType(playerData.fishType);
    }
    // _audioPlayerComponent.playBgm('9. Space Invaders.wav');
    super.onAttach();
  }

  @override
  void onDetach() {
    // _audioPlayerComponent.stopBgm();
    super.onDetach();
  }

  @override
  void update(double dt) {
    super.update(dt);

    // コンポーネントリストの各コンポーネントに対して、_commandList の各コマンドを
    // 実行します。コマンドが特定のコンポーネントに対して有効でない場合、Command の
    // run() メソッドはノーオペレーションです。
    for (var command in _commandList) {
      for (var component in children) {
        command.run(component);
      }
    }

    // 処理されるすべてのコマンドを削除し、次の更新で処理されるすべての新しいコマンド
    // を追加する。
    _commandList.clear();
    _commandList.addAll(_addLaterCommandList);
    _addLaterCommandList.clear();

    if (_player.isMounted) {
      // スコアとヘルスコンポーネントを最新の値で更新する。
      _scoreText.text = '${_player.score}こ';

      if (_isStarted == false) {
        pauseEngine();
        overlays.add(StartCountDown.id);
        _isStarted = true;
      }

      /// [Player.health] がゼロになり、カメラの揺れが止まると
      /// [GameOverMenu] を表示します。
      if (_player.hIndex < 0 && (!camera.shaking)) {
        pauseEngine();
        overlays.remove(PauseButton.id);
        overlays.add(GameClearMenu.id);
      }
    }
  }

  // このメソッドはアプリの状態を処理し、必要に応じてゲームを一時停止します。
  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (_player.hIndex >= 0) {
          pauseEngine();
          overlays.remove(PauseButton.id);
          overlays.add(PauseMenu.id);
        }
        break;
    }

    super.lifecycleStateChange(state);
  }

  // 指定されたコマンドをコマンドリストに追加する。
  void addCommand(Command command) {
    _addLaterCommandList.add(command);
  }

  // ゲームを初期状態にリセットします。ゲームの再起動中および終了中に呼び出す必要がある。
  void reset() {
    // 最初にマネージャーをリセットする。
    _player.reset();
    _obstacleManager.reset();
    _plasticManager.reset();
    _isStarted = false;

    // ゲームからすべての障害物とプラスチックを削除する。
    // プレイヤーのスコアが増加するためdestroy() を呼び出していない。
    children.whereType<Obstacle>().forEach((obstacle) {
      obstacle.removeFromParent();
    });
    children.whereType<Plastic>().forEach((plastic) {
      plastic.removeFromParent();
    });
  }
}
