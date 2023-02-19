import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:poipla_app/screens/adventure/game/screens/main_menu_screen.dart';
import 'package:poipla_app/screens/adventure/game/screens/select_fish_screen.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailModal extends StatelessWidget {
  const DetailModal({
    Key? key,
    required this.prefName,
    required this.kana,
    required this.earnPoint,
    required this.costumeName,
  }) : super(key: key);

  final String prefName, kana, costumeName;
  final int earnPoint;
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    // This opens the app in fullscreen mode.
    Flame.device.fullScreen();

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: SizedBox(
        width: deviceW,
        height: deviceH,
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                kana,
                style: const TextStyle(
                  fontSize: 14,
                  color: kFontColor,
                  letterSpacing: 2.0,
                ),
              ),
              Text(
                prefName,
                style: const TextStyle(
                  fontSize: 24,
                  color: kFontColor,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "きせかえでつかえる",
                    style: TextStyle(
                      color: kFontColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "ポイント",
                        style: TextStyle(
                          color: Color(0xFFFFA63E),
                          fontSize: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "をゲットしよう！",
                          style: TextStyle(
                            color: kFontColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 60),
                    child: Image.asset(
                      "assets/svg/shachihoko.png",
                      width: deviceW * 0.45,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: deviceW * 0.6,
                        margin: const EdgeInsets.only(bottom: 24),
                        child: GestureDetector(
                          onTap: () async {
                            await soundEffect.resume();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SelectFishScreen();
                                },
                              ),
                            );
                          },
                          child: const AppButton(text: "ぼうけんする", isPos: true),
                        ),
                      ),
                      Container(
                        width: deviceW * 0.45,
                        margin: const EdgeInsets.only(bottom: 40),
                        child: GestureDetector(
                          onTap: () async {
                            await soundEffect.resume();
                            Navigator.pop(context);
                          },
                          child: const AppButton(text: "とじる", isPos: false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  } // アプリのドキュメント ディレクトリでハイブを初期化し、すべての
}

// // ハイブ アダプターも登録する関数。
// Future<void> initHive() async {
//   await Hive.initFlutter();

//   Hive.registerAdapter(PlayerDataAdapter());
//   Hive.registerAdapter(FishTypeAdapter());
//   Hive.registerAdapter(SettingsAdapter());
// }

//   /// 保存されている [PlayerData] をディスクから読み込む関数
//   Future<PlayerData> getPlayerData() async {
//     // プレーヤーデータボックスを開き、そこからプレーヤーデータを読み取る。
//     final box = await Hive.openBox<PlayerData>(PlayerData.playerDataBox);
//     final playerData = box.get(PlayerData.playerDataKey);

//     // プレイヤーデータが null の場合、これはゲームの新規起動であることを意味します。
//     // このような場合、最初にデフォルトのプレーヤーデータをプレーヤーデータボックスに
//     // 保存してから、同じものを返す。
//     if (playerData == null) {
//       box.put(
//         PlayerData.playerDataKey,
//         PlayerData.fromMap(PlayerData.defaultData),
//       );
//     }

//     return box.get(PlayerData.playerDataKey)!;
//   }

//   /// 保存されている [Settings] をディスクから読み込む関数。
//   Future<Settings> getSettings() async {
//     // 設定ボックスを開き、そこから設定を読み取ります。
//     final box = await Hive.openBox<Settings>(Settings.settingsBox);
//     final settings = box.get(Settings.settingsKey);

//     // 設定が null の場合、これはゲームの新規起動であることを意味します。
//     // このような場合、最初にデフォルト設定を設定ボックスに保存してから
//     // 同じ設定を返します。
//     if (settings == null) {
//       box.put(Settings.settingsKey,
//           Settings(soundEffects: true, backgroundMusic: true));
//     }

//     return box.get(Settings.settingsKey)!;
//   }
// }
