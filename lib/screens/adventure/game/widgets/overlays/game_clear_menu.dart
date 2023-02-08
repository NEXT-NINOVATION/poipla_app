import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';
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
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Image.asset(
                'assets/images/trush.png',
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

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                    (_) => false);
              },
              child: const AppButton(text: "おうちへかえる", isPos: false),
            ),
          ],
        ),
      ),
    );
  }
}
