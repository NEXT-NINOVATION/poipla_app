import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:poipla_app/screens/app_button.dart';

class ResultModal extends StatelessWidget {
  const ResultModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    WidgetsFlutterBinding.ensureInitialized();

    // This opens the app in fullscreen mode.
    Flame.device.fullScreen();

    // Initialize hive.
    initHive();

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
          // alignment: Alignment.center,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFA63E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    const Text(
                      "きれいになったよ！",
                      style: TextStyle(
                        color: kAppBarFontColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ひろったごみ",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorRed,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                              fontSize: 56,
                              color: kFontColorRed,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "こ",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 60,
                        thickness: 1,
                        indent: 52,
                        endIndent: 52,
                        color: Colors.black38,
                      ),
                      const Text(
                        "ポイントゲット！",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorImportant,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                              fontSize: 56,
                              color: kFontColorImportant,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Text(
                              "ポイント",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 60,
                        thickness: 1,
                        indent: 52,
                        endIndent: 52,
                        color: Colors.black38,
                      ),
                      const Text(
                        "いままでのハイスコア",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorBlue,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "100000",
                            style: TextStyle(
                              fontSize: 40,
                              color: kFontColorBlue,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            child: const Text(
                              "こ",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const AppButton(text: "とじる", isPos: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } // アプリのドキュメント ディレクトリでハイブを初期化し、すべての

  // ハイブ アダプターも登録する関数。
  Future<void> initHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PlayerDataAdapter());
    Hive.registerAdapter(FishTypeAdapter());
    Hive.registerAdapter(SettingsAdapter());
  }

  /// 保存されている [PlayerData] をディスクから読み込む関数
  Future<PlayerData> getPlayerData() async {
    // プレーヤーデータボックスを開き、そこからプレーヤーデータを読み取る。
    final box = await Hive.openBox<PlayerData>(PlayerData.playerDataBox);
    final playerData = box.get(PlayerData.playerDataKey);

    // プレイヤーデータが null の場合、これはゲームの新規起動であることを意味します。
    // このような場合、最初にデフォルトのプレーヤーデータをプレーヤーデータボックスに
    // 保存してから、同じものを返す。
    if (playerData == null) {
      box.put(
        PlayerData.playerDataKey,
        PlayerData.fromMap(PlayerData.defaultData),
      );
    }

    return box.get(PlayerData.playerDataKey)!;
  }

  /// 保存されている [Settings] をディスクから読み込む関数。
  Future<Settings> getSettings() async {
    // 設定ボックスを開き、そこから設定を読み取ります。
    final box = await Hive.openBox<Settings>(Settings.settingsBox);
    final settings = box.get(Settings.settingsKey);

    // 設定が null の場合、これはゲームの新規起動であることを意味します。
    // このような場合、最初にデフォルト設定を設定ボックスに保存してから
    // 同じ設定を返します。
    if (settings == null) {
      box.put(Settings.settingsKey,
          Settings(soundEffects: true, backgroundMusic: true));
    }

    return box.get(Settings.settingsKey)!;
  }
}
