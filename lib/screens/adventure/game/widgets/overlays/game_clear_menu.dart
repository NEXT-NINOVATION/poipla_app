import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:poipla_app/screens/adventure/components/result_modal.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';
import 'package:poipla_app/screens/adventure/game/player.dart';
import 'package:poipla_app/screens/adventure/game/widgets/overlays/start_count_down.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/home/home_screen.dart';

import '../../screens/main_menu_screen.dart';
import 'pause_button.dart';

// This class represents the game over menu overlay.
class GameClearMenu extends StatelessWidget {
  static const String id = 'GameClearMenu';
  final AdventureGame gameRef;

  const GameClearMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ゴールメニュー
            Image.asset(
              'assets/images/clear_text.png',
              width: MediaQuery.of(context).size.width / 1.1,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 18),
              child: Lottie.asset(
                'assets/animation/trush.json',
                width: MediaQuery.of(context).size.width / 1.4,
              ),
            ),
            GestureDetector(
              onTap: () {
                gameRef.overlays.remove(GameClearMenu.id);
                gameRef.overlays.remove(StartCountDown.id);
                gameRef.removeFromParent();
                gameRef.reset();
                gameRef.resumeEngine();
                final List result = gameRef.getResult();

                // Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.of(context).pop();
                Navigator.pop(context, result);
              },
              child: const AppButton(text: "おうちへかえる", isPos: false),
            ),
          ],
        ),
      ),
    );
  }
}
