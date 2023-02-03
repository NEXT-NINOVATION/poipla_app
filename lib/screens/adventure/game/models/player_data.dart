import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import 'character_details.dart';

part 'player_data.g.dart';

// このクラスは、プレーヤーの進行状況を追跡するために保存する必要がある
// すべての永続データを表します。
@HiveType(typeId: 0)
class PlayerData extends ChangeNotifier with HiveObjectMixin {
  static const String playerDataBox = 'PlayerDataBox';
  static const String playerDataKey = 'PlayerData';

  // プレイヤーの現在のさかなのタイプ。
  @HiveField(0)
  FishType fishType;

  // プレイヤーが所有するすべてのさかなのリスト。
  // タイプを保存するだけで十分であることに注意してください。
  @HiveField(1)
  final List<FishType> ownedfishes;

  // これまでの最高のプレーヤースコア
  @HiveField(2)
  late int _highScore;
  int get highScore => _highScore;

  // お金のバランスを取る
  @HiveField(3)
  int money;

  // 現在のスコアを追跡します。
  // ゲームが実行されていない場合、これは最後のラウンドのスコアを表します。
  int _currentScore = 0;

  int get currentScore => _currentScore;

  set currentScore(int newScore) {
    _currentScore = newScore;
    // currentScoreを新しい値に設定するときは、highScoreも必ず更新してください。
    if (_highScore < _currentScore) {
      _highScore = _currentScore;
    }
  }

  PlayerData({
    required this.fishType,
    required this.ownedfishes,
    int highScore = 0,
    required this.money,
  }) {
    _highScore = highScore;
  }

  /// 指定されたマップから [PlayerData] の新しいインスタンスを作成します。
  PlayerData.fromMap(Map<String, dynamic> map)
      : fishType = map['currentFishType'],
        ownedfishes = map['ownedFishTypes']
            .map((e) => e as FishType) // 各要素をマッピングします。
            .cast<FishType>() // 各要素を FishType にキャストします。
            .toList(), // List<FishType> に変換します。
        _highScore = map['highScore'],
        money = map['money'];

  // ゲームの初回起動時に最初の PlayerData インスタンスを作成する
  // ために使用するデフォルトマップ。
  static Map<String, dynamic> defaultData = {
    'currentFishType': FishType.suu,
    'ownedFishTypes': [FishType.suu],
    'highScore': 0,
    'money': 0,
  };

  /// 指定された [FishType] がプレイヤーによって所有されている
  /// 場合、trueを返します。
  // bool isOwned(FishType fishType) {
  //   return ownedfishes.contains(fishType);
  // }

  /// プレイヤーの現在のさかなが指定された [FishType] と
  /// 同じ場合、trueを返します。
  // bool isEquipped(FishType fishType) {
  //   return (this.fishType == fishType);
  // }

  /// 指定された [FishType] をプレイヤーの現在のさかなとして設定します。
  void equip(FishType fishType) {
    this.fishType = fishType;
    notifyListeners();

    print(this.fishType);

    // プレーヤーデータをディスクに保存
    save();
  }
}
