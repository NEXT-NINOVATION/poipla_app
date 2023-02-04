import 'dart:math';

import 'package:flame/sprite.dart';
import 'package:flame/components.dart';
import 'package:poipla_app/screens/adventure/game/models/plastic_data.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:provider/provider.dart';

import 'game.dart';
import 'plastic.dart';
import 'knows_game_size.dart';

// このコンポーネントクラスは、新しい敵コンポーネントを画面の上部からランダムにスポーンします。
// 子コンポーネントを追加できるように HasGameRef mixin を使用します。
class PlasticManager extends Component
    with KnowsGameSize, HasGameRef<AdventureGame> {
  // 定期的に敵のスポナーコードを実行するタイマー。
  late Timer _timer;

  // EnemyManager が新しい敵の生成を停止する時間を制御する。
  late Timer _freezeTimer;

  // spriteSheet への参照には、敵のスプライトが含まれている。
  SpriteSheet spriteSheet;

  // 乱数を生成する Random クラスのオブジェクトを保持。
  Random random = Random();

  PlasticManager({required this.spriteSheet}) : super() {
    // タイマーが明示的に停止するまで、1.7 秒ごとに _spawnEnemy() を呼び出すようにタイマーを設定。
    _timer = Timer(1.7, onTick: _spawnPlastic, repeat: true);

    // フリーズ時間を2秒に設定します。2秒後にスポーンタイマーが再び開始されます。
    _freezeTimer = Timer(2, onTick: () {
      _timer.start();
    });
  }

  // 画面上部のランダムな位置に新しい敵を出現させる。
  void _spawnPlastic() {
    Vector2 initialSize = Vector2(100, 100);
    // random.nextDouble() は、0から1の間の乱数を生成します。
    // これに gameRef.size.x を掛けると、値が0から画面の幅に収まるようになります。
    Vector2 position = Vector2(random.nextDouble() * gameRef.size.x, 0);

    // 敵のスプライトが画面内に留まるようにベクトルをクランプします。
    position.clamp(
      Vector2.zero() + initialSize / 2,
      gameRef.size - initialSize / 2,
    );

    // 使用する前に、有効な BuildContext があることを確認してください。
    if (gameRef.buildContext != null) {
      // 現在のスコアを取得し、このスコアでスポーンできる敵の最大レベルを把握する。
      int currentScore =
          Provider.of<PlayerData>(gameRef.buildContext!, listen: false)
              .currentScore;
      // int maxLevel = mapScoreToMaxEnemyLevel(currentScore);

      /// リストからランダムな [EnemyData] オブジェクトを取得する。
      final plasticData = _plasticDataList.elementAt(random.nextInt(5 - 2));

      Plastic plastic = Plastic(
        sprite: spriteSheet.getSpriteById(plasticData.spriteId),
        size: plasticData.objectSize,
        position: position,
        plasticData: plasticData,
      );

      // 敵のスプライトが中央にあることを確認する。
      plastic.anchor = Anchor.center;
      plastic.priority = -1;

      // EnemyManager の代わりに、ゲームインスタンスのコンポーネントリストに追加します。
      // これにより、衝突検出が正しく機能することが保証されます。
      gameRef.add(plastic);
    }
  }

  // 特定のスコアに対して、このメソッドはスポーンに使用できる敵の最大レベルを返します。
  // int mapScoreToMaxEnemyLevel(int score) {
  //   int level = 1;

  //   if (score > 1500) {
  //     level = 4;
  //   } else if (score > 500) {
  //     level = 3;
  //   } else if (score > 100) {
  //     level = 2;
  //   }

  //   return level;
  // }

  @override
  void onMount() {
    super.onMount();
    // 現在の敵マネージャーが準備され、ゲームインスタンスに追加されたらすぐにタイマーを開始します。
    _timer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    // 現在の敵のマネージャーがゲームインスタンスから削除されている場合は、タイマーを停止します。
    _timer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    // タイマーをデルタ時間で更新して、タイマーを刻みます。
    _timer.update(dt);
    _freezeTimer.update(dt);
  }

  // タイマーを停止して再開します。ゲームの再起動中および終了中に呼び出す必要があります。
  void reset() {
    _timer.stop();
    _timer.start();
  }

  // 呼び出されると、スポーンタイマーを2秒間一時停止します。
  void freeze() {
    _timer.stop();
    _freezeTimer.stop();
    _freezeTimer.start();
  }

  /// [EnemyData]の非公開リスト。
  final List<PlasticData> _plasticDataList = [
    PlasticData(
      point: 1,
      speed: 200,
      spriteId: 3,
      // level: 1,
      hMove: false,
      objectType: 0,
      objectSize: Vector2(100, 100),
    ),
    PlasticData(
      point: 1,
      speed: 200,
      spriteId: 4,
      // level: 1,
      hMove: false,
      objectType: 0,
      objectSize: Vector2(100, 100),
    ),
    PlasticData(
      point: 1,
      speed: 200,
      spriteId: 5,
      // level: 1,
      hMove: false,
      objectType: 0,
      objectSize: Vector2(100, 100),
    ),
  ];
}
