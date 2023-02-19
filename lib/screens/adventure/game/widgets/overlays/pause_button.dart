import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';

import 'pause_menu.dart';

// This class represents the pause button overlay.
class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final AdventureGame gameRef;

  const PauseButton({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(top: 90, left: 20),
        child: GestureDetector(
          child: Image.asset(
            "assets/images/pause_button.png",
            width: 48,
          ),
          onTap: () {
            gameRef.pauseEngine();
            gameRef.overlays.add(PauseMenu.id);
            // gameRef.overlays.remove(PauseButton.id);
          },
        ),
      ),
    );
  }
}
