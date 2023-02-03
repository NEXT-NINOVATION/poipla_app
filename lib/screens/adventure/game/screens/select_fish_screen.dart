import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/custom_back_button.dart';
import 'package:provider/provider.dart';

import '../models/player_data.dart';
import '../models/character_details.dart';

import 'game_play_screen.dart';

// Represents the fish selection menu from where player can
// change current fish or buy a new one.
class SelectFishScreen extends StatelessWidget {
  const SelectFishScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FishType _fishType = Fish.fishes.entries.elementAt(0).key;

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
      body: Container(
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
                    itemCount: Fish.fishes.length,
                    slideBuilder: (index) {
                      final fish = Fish.fishes.entries.elementAt(index).value;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 50),
                            child: Image.asset(
                              fish.assetPath,
                              width: 120,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                StatusDetails(text: "たいりょく", star: fish.health),
                                const StatusDetails(text: "かっこよさ", star: 4),
                              ],
                            ),
                          ),
                          // Text('Level: ${fish.level}'),
                        ],
                      );
                    },
                    onSlideChanged: (value) {
                      // _typeIndex = value;
                      // print(_typeIndex);
                      _fishType = Fish.fishes.entries.elementAt(value).key;
                      print(_fishType);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 120, left: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/arrow_left.png",
                        width: 56,
                      ),
                      Image.asset(
                        "assets/images/arrow_right.png",
                        width: 56,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Consumer<PlayerData>(
              builder: (context, playerData, child) {
                return GestureDetector(
                  onTap: () {
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
      ),
    );
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
