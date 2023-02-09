// このクラスは、さかなを定義するすべてのデータを表します。
import 'package:hive/hive.dart';

part 'character_details.g.dart';

class Fish {
  // さかなの名前
  final String name;

  // さかなのコスト
  // final int cost;

  // さかなのスピード
  final double speed;

  // さかなの体力
  final int health;

  // キャラの特徴
  final String text;

  // ゲームでこのさかなを表示するために使用される SpriteId。
  final int spriteId;

  // ゲームの外でこのさかなを表示するために使用されるアセットへのパス。
  final String assetPath;

  // さかなのレベル
  final int level;

  const Fish({
    required this.name,
    // required this.cost,
    required this.speed,
    required this.health,
    required this.text,
    required this.spriteId,
    required this.assetPath,
    required this.level,
  });

  /// fishType を指定すると、このメソッドはさかなのすべての詳細を
  /// 保持する対応する Fish オブジェクトを返します。
  static Fish getFishByType(FishType fishType) {
    /// [fishes] に与えられた [fishType] が含まれていない可能性は非常に低いです。
    /// しかし、それが発生した場合は、[FishType.Canary] のデータのみを返します。
    return fishes[fishType] ?? fishes.entries.first.value;
  }

  /// このマップは、各 [FishType] のすべてのメタデータを保持します。
  static const Map<FishType, Fish> fishes = {
    FishType.suu: Fish(
      name: 'いつものスー',
      // cost: 0,
      speed: 200,
      health: 3,
      text: "かわいさ",
      spriteId: 0,
      assetPath: 'assets/images/suu.png',
      level: 1,
    ),
    FishType.takosuke: Fish(
      name: 'たこすけのきせかえ',
      // cost: 0,
      speed: 200,
      health: 3,
      text: "イカスミ",
      spriteId: 1,
      assetPath: 'assets/images/takosuke.png',
      level: 1,
    ),
    FishType.micchan: Fish(
      name: 'ミッちゃんのきせかえ',
      // cost: 0,
      speed: 300,
      health: 2,
      text: "ビリビリ",
      spriteId: 2,
      assetPath: 'assets/images/micchan.png',
      level: 1,
    ),
    FishType.lala: Fish(
      name: 'ララのきせかえ',
      // cost: 0,
      speed: 100,
      health: 4,
      text: "おおきさ",
      spriteId: 3,
      assetPath: 'assets/images/lala.png',
      level: 1,
    ),
    FishType.kamekiti: Fish(
      name: 'かめきちのきせかえ',
      // cost: 0,
      speed: 300,
      health: 4,
      text: "ながいき",
      spriteId: 3,
      assetPath: 'assets/images/kamekiti.png',
      level: 1,
    ),
    FishType.sameko: Fish(
      name: 'サメコのきせかえ',
      // cost: 0,
      speed: 400,
      health: 2,
      text: "かっこよさ",
      spriteId: 5,
      assetPath: 'assets/images/sameko.png',
      level: 1,
    ),
    FishType.takoyaki: Fish(
      name: 'たこやきのきせかえ',
      // cost: 0,
      speed: 200,
      health: 3,
      text: "おいしさ",
      spriteId: 6,
      assetPath: 'assets/images/takoyaki.png',
      level: 1,
    ),
    FishType.osakaCastle: Fish(
      name: 'おおさかじょうのきせかえ',
      // cost: 0,
      speed: 200,
      health: 3,
      text: "れきし",
      spriteId: 7,
      assetPath: 'assets/images/osaka_castle.png',
      level: 1,
    ),
  };
}

// この列挙型は、このゲームで利用可能なすべてのさかなの種類を表します。
@HiveType(typeId: 1)
enum FishType {
  @HiveField(0)
  suu,
  @HiveField(1)
  takosuke,
  @HiveField(2)
  micchan,
  @HiveField(3)
  lala,
  @HiveField(4)
  kamekiti,
  @HiveField(5)
  sameko,
  @HiveField(6)
  takoyaki,
  @HiveField(7)
  osakaCastle,
}
