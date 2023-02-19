import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/costume_provider.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/custom_back_button.dart';
import 'package:provider/provider.dart' as provider;

import '../models/player_data.dart';
import '../models/character_details.dart';

import 'game_play_screen.dart';
import 'package:audioplayers/audioplayers.dart';

// Represents the fish selection menu from where player can
// change current fish or buy a new one.
class SelectFishScreen extends ConsumerStatefulWidget {
  const SelectFishScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SelectFishScreen> createState() => _SelectFishScreenState();
}

final myCostumeFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(costumeRepositoryProvider).getMyCostumes();
});

class _SelectFishScreenState extends ConsumerState<SelectFishScreen> {
  int? selectedCosId;
  bool selected = true;
  final List myCostumeList = [0];

  @override
  void initState() {
    selectedCosId = ref.read(accountStoreProvider).currentUser?.costumeId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FishType _fishType = Fish.fishes.entries.elementAt(0).key;
    final asyncMyCostumes = ref.watch(myCostumeFutureProvider);

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "ぼうけんにいく",
            style: TextStyle(
              color: kAppBarFontColor,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
          leading: const CustomBackButton(),
          leadingWidth: 80,
        ),
        body: asyncMyCostumes.when(data: (data) {
          final selectedCos = () {
            final filtered =
                data.where((element) => element.id == selectedCosId);
            if (filtered.isEmpty) {
              return null;
            } else {
              return filtered.first;
            }
          }();
          data.forEach((e) {
            myCostumeList.add(e.id);
          });
          print(data);
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB6E9EB), Color(0xFF207CAF)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Game title.
                Column(
                  children: const [
                    Text(
                      'どのスーにする？',
                      style: TextStyle(
                        fontSize: 28,
                        color: kFontColor,
                      ),
                    ),
                    Text(
                      'みぎやひだりにうごかしてえらぼう',
                      style: TextStyle(
                        fontSize: 18,
                        color: kFontColor,
                      ),
                    ),
                  ],
                ),

                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: CarouselSlider.builder(
                        // itemCount: Fish.fishes.length,
                        itemCount: myCostumeList.length,
                        slideBuilder: (index) {
                          final fish = Fish.fishes.entries
                              .elementAt(myCostumeList[index])
                              .value;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 50),
                                child: Image.asset(
                                  fish.assetPath,
                                  width: 120,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      fish.name,
                                      style: const TextStyle(
                                        color: kFontColor,
                                        fontSize: 22,
                                      ),
                                    ),
                                    StatusDetails(
                                        text: "はやさ",
                                        star: (fish.speed / 100).round()),
                                    StatusDetails(
                                        text: "たいりょく", star: fish.health),
                                    StatusDetails(text: fish.text, star: 4),
                                  ],
                                ),
                              ),
                              // Text('Level: ${fish.level}'),
                            ],
                          );
                        },
                        onSlideChanged: (value) {
                          _fishType = Fish.fishes.entries
                              .elementAt(myCostumeList[value])
                              .key;
                        },
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 120, left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/arrow_left.png",
                            width: 72,
                          ),
                          Image.asset(
                            "assets/images/arrow_right.png",
                            width: 72,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                provider.Consumer<PlayerData>(
                  builder: (context, playerData, child) {
                    return GestureDetector(
                      onTap: () async {
                        await soundEffect.resume();
                        final bgm = AudioPlayer(playerId: "poipla");
                        await bgm.stop();
                        playerData.equip(_fishType);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const GamePlayScreen(),
                          ),
                        );
                      },
                      child: const AppButton(text: "これにする！", isPos: true),
                    );
                  },
                ),
                const SizedBox(height: 50),
                // スタートボタン
              ],
            ),
          );
        }, error: (e, st) {
          return const Center(
            child: Text("コスチュームの取得に失敗"),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

class StatusDetails extends StatelessWidget {
  const StatusDetails({
    Key? key,
    required this.text,
    required this.star,
  }) : super(key: key);

  final String text;
  final int star;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  ${fish.speed}
          Text(
            text,
            style: const TextStyle(
              color: kFontColor,
              fontSize: 20,
            ),
          ),
          SizedBox(
            width: 178,
            height: 34,
            child: Row(
              children: [
                for (int i = 0; i < star; i++) ...{
                  Image.asset(
                    "assets/images/star.png",
                    width: 34,
                  ),
                  const SizedBox(width: 10),
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}
