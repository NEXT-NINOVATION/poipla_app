import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';
import 'package:poipla_app/screens/app_button.dart';

import 'pause_button.dart';

// This class represents the pause menu overlay.
class PauseMenu extends StatelessWidget {
  static const String id = 'PauseMenu';
  final AdventureGame gameRef;

  const PauseMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          width: deviceW * 0.86,
          height: deviceH * 0.37,
          child: Column(
            children: [
              Container(
                width: deviceW * 0.86,
                height: 60,
                decoration: const BoxDecoration(
                  color: kAppBarColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "ゲームをとめる",
                    style: TextStyle(
                      color: kAppBarFontColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // GestureDetector(
              //   onTap: () async {
              //     await soundEffect.resume();
              //     gameRef.overlays.remove(PauseMenu.id);
              //     gameRef.overlays.add(PauseButton.id);
              //     gameRef.reset();
              //     gameRef.resumeEngine();
              //   },
              //   child: const PauseMenuButton(text: "やりなおす"),
              // // ),
              // const SizedBox(height: 32),
              GestureDetector(
                onTap: () async {
                  await soundEffect.resume();
                  gameRef.overlays.remove(PauseMenu.id);
                  gameRef.reset();
                  gameRef.resumeEngine();

                  // Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.of(context).pop();
                  Navigator.pop(context, null);
                },
                child: const PauseMenuButton(text: "おうちへもどる"),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  await soundEffect.resume();
                  gameRef.resumeEngine();
                  gameRef.overlays.remove(PauseMenu.id);
                  gameRef.overlays.add(PauseButton.id);
                },
                child: const AppButton(text: "つづける", isPos: false),
              ),
            ],
          ),
        ),
      ),
    );
    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       // Pause menu title.
    //       const Padding(
    //         padding: EdgeInsets.symmetric(vertical: 50.0),
    //         child: Text(
    //           'ちょっと待って！',
    //           style: TextStyle(
    //             fontSize: 50.0,
    //             color: Colors.black,
    //             shadows: [
    //               Shadow(
    //                 blurRadius: 20.0,
    //                 color: Colors.white,
    //                 offset: Offset(0, 0),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),

    //       // Resume button.
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width / 3,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             gameRef.resumeEngine();
    //             gameRef.overlays.remove(PauseMenu.id);
    //             gameRef.overlays.add(PauseButton.id);
    //           },
    //           child: const Text('つづける'),
    //         ),
    //       ),

    //       // Restart button.
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width / 3,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             gameRef.overlays.remove(PauseMenu.id);
    //             gameRef.overlays.add(PauseButton.id);
    //             gameRef.reset();
    //             gameRef.resumeEngine();
    //           },
    //           child: const Text('やりなおす'),
    //         ),
    //       ),

    //       // Exit button.
    //       SizedBox(
    //         width: MediaQuery.of(context).size.width / 3,
    //         child: ElevatedButton(
    //           onPressed: () {
    //             gameRef.overlays.remove(PauseMenu.id);
    //             gameRef.reset();
    //             gameRef.resumeEngine();

    //             // Navigator.popUntil(context, (route) => route.isFirst);
    //             Navigator.of(context).pop();
    //             Navigator.pop(context, null);
    //           },
    //           child: const Text('おうちへもどる'),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class PauseMenuButton extends StatelessWidget {
  const PauseMenuButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // ボタンデザインContainer
        Container(
          width: 200,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              // ボタンのシャドウ
              BoxShadow(
                color: Color(0xFFC29217),
                offset: Offset(0, 8),
              ),
              // ボタン
              BoxShadow(
                color: Color(0xFFFFCD4E),
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: kFontColor,
            ),
          ),
        ),
      ],
    );
  }
}
