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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
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
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          Text(
                            "$earnPoint",
                            style: const TextStyle(
                              fontSize: 24,
                              color: kFontColorImportant,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const Text(
                            "ポイントゲット！",
                            style: TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          const Text(
                            "けいけんちゲット！",
                            style: TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          Text(
                            "「$costumeName」もらえるかも？",
                            style: const TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/svg/shachihoko.png",
                      width: deviceW * 0.45,
                    ),
                  ),
                  const Text(
                    "〇〇がかえってくるじかん",
                    style: TextStyle(
                      fontSize: 16,
                      color: kFontColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Text(
                      "18:30",
                      style: TextStyle(
                        fontSize: 40,
                        color: kFontColorImportant,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const AppButton(text: "とじる", isPos: false),
                  ),
                ),
              ],
            ),
          ],
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
