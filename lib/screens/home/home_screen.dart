import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:poipla_app/providers/costume_provider.dart';
import 'package:poipla_app/screens/home/components/adventure_button.dart';
import 'package:poipla_app/screens/home/components/adventure_result_modal.dart';
import 'package:poipla_app/screens/home/components/change_costume_button.dart';
import 'package:poipla_app/screens/home/components/come_back_timer.dart';
import 'package:poipla_app/screens/home/components/game_score.dart';
import 'package:poipla_app/screens/home/components/present_modal.dart';
import 'package:poipla_app/screens/home/components/qr_camera_modal.dart';
import 'package:poipla_app/screens/home/components/setting_button.dart';
import 'package:poipla_app/screens/home/components/setting_modal.dart';
import 'package:poipla_app/screens/home/components/shop_button.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:collection/collection.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

final myCostumesFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(myCostumeStoreProvider).fetchAll();
});

final accountFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(accountStoreProvider).fetch();
});

class _HomeScreenState extends ConsumerState<HomeScreen> with RouteAware {
  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();
  final bgm = AudioPlayer(playerId: "poipla");

  @override
  void initState() {
    super.initState();

    bgm.setSourceAsset("audio/home.mp3");
    bgm.setVolume(1.0);
    bgm.setReleaseMode(ReleaseMode.loop);
    bgm.resume();
  }

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    // 冒険中フラグ
    bool isLeave = false;
    // 帰ってきた表示フラグ
    bool isExc = false;

    final costumes = ref.watch(myCostumeStoreProvider).myCostumes;
    ref.watch(myCostumesFutureProvider);
    final authStore = ref.watch(accountStoreProvider).currentUser;
    ref.watch(accountFutureProvider);

    final currentCostume = costumes
        .firstWhereOrNull((element) => element.id == authStore?.costumeId);

    final currentScore = authStore!.totalPet;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: kBackgroundColors,
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            // "${authStore.currentUser?.name}のおうち",
            "スーのおうち",
            style: const TextStyle(
              color: kAppBarFontColor,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
          actions: [
            GestureDetector(
              onTap: () {
                soundEffect.resume();
                showDialog(
                  // Dialogの周囲の黒い部分をタップしても閉じないようにする
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => SettingModal(),
                );
              },
              child: const SettingButton(),
            ),
          ],
        ),
        body: Stack(
          children: [
            GameScore(totalPla: currentScore.toInt()),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 25, left: 15),
                  child: Column(
                    children: [
                      // ToDo:コンポーネント化する
                      GestureDetector(
                        onTap: () {
                          soundEffect.resume();
                          showDialog(
                            // Dialogの周囲の黒い部分をタップしても閉じないようにする
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => PresentModal(),
                          );
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE6A6),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.only(bottom: 3.0),
                                    child: SvgPicture.asset(
                                      "assets/svg/present.svg",
                                    ),
                                  ),
                                  BorderedText(
                                    strokeWidth: 2,
                                    strokeColor: Colors.white,
                                    child: const Text(
                                      "プレゼント",
                                      style: TextStyle(
                                          color: kFontColorBlue, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isExc == true)
                              Positioned(
                                right: -12,
                                top: -12,
                                child: SvgPicture.asset(
                                  "assets/svg/exc_present.svg",
                                ),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // ToDo:コンポーネント化する
                      // QRボタン
                      GestureDetector(
                        onTap: () {
                          soundEffect.resume();
                          showDialog(
                            // Dialogの周囲の黒い部分をタップしても閉じないようにする
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) =>
                                const QRCameraModal(),
                          );
                        },
                        child: Container(
                          width: 72,
                          height: 72,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6A6),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.only(bottom: 3.0),
                                child: SvgPicture.asset(
                                  "assets/svg/qr.svg",
                                ),
                              ),
                              BorderedText(
                                strokeWidth: 2,
                                strokeColor: Colors.white,
                                child: const Text(
                                  "QR",
                                  style: TextStyle(
                                    color: kFontColorBlue,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isLeave == true
                    ? ComeBackTimer()
                    : Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          GestureDetector(onTap: () {
                            if (isExc == true) {
                              showDialog(
                                // Dialogの周囲の黒い部分をタップしても閉じないようにする
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) =>
                                    const AdventureResultModal(
                                  prefName: "愛知県",
                                  kana: "あいちけん",
                                  earnPoint: 50,
                                  costumeName: "シャチホコ",
                                ),
                              );
                            }
                          }, child: () {
                            if (currentCostume == null) {
                              return Lottie.asset(
                                "assets/animation/fish_default.json",
                                width: deviceW * 0.8,
                              );
                            } else {
                              return Lottie.asset(
                                "assets/animation/fish_${currentCostume.image}.json",
                                width: deviceW * 0.8,
                              );
                            }
                          }()),
                          isExc == true
                              ? Positioned(
                                  right: -10,
                                  top: -120,
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        // Dialogの周囲の黒い部分をタップしても閉じないようにする
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PresentModal(),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/svg/exc_fish.svg",
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                Container(
                  margin: const EdgeInsets.only(bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          ShopButton(),
                          isLeave == true
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0x88403F4C),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/svg/lock.svg",
                                      width: 32,
                                      height: 32,
                                    )
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      Stack(
                        children: [
                          AdventureButton(),
                          isLeave == true
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0x88403F4C),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/svg/lock.svg",
                                      width: 40,
                                      height: 40,
                                    )
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      Stack(
                        children: [
                          ChangeCostumeButton(),
                          isLeave == true
                              ? Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0x88403F4C),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      "assets/svg/lock.svg",
                                      width: 32,
                                      height: 32,
                                    )
                                  ],
                                )
                              : Container(),
                        ],
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
  }
}
