import 'package:flame/extensions.dart';

/// このクラスは、[Enemy] コンポーネントを作成するために必要なすべての詳細を表します。
class PlasticData {
  // 敵のスピード
  final double speed;

  // メインスプライトシートのスプライトID
  final int spriteId;

  // 敵のレベル
  // final int level;

  // 敵が水平に移動できるかどうかを示す。
  final bool hMove;

  // プラスチックを取得するとポイントを獲得。
  final int point;

  // プラスチックか障害物判別用
  final int objectType;

  // オブジェクトサイズ
  final Vector2 objectSize;

  const PlasticData({
    required this.speed,
    required this.spriteId,
    // required this.level,
    required this.hMove,
    required this.point,
    required this.objectType,
    required this.objectSize,
  });
}
