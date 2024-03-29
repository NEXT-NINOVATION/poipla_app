import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:poipla_app/screens/adventure/adventure_screen.dart';
import 'package:poipla_app/screens/adventure/components/result_modal.dart';
import 'package:audioplayers/audioplayers.dart';

class AdventureButton extends StatelessWidget {
  const AdventureButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final soundEffect = AudioPlayer(playerId: "soundEffect");
    final bgm = AudioPlayer(playerId: "poipla");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);
    return GestureDetector(
      onTap: () async {
        soundEffect.resume();
        // GoRouter.of(context).push('/adventure');
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return AdventureScreen();
            },
          ),
        );
        print("result:$result");
        await bgm.resume();
        if (result != null) {
          showDialog(
            // Dialogの周囲の黒い部分をタップしても閉じないようにする
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => ResultModal(
              pla: result[0],
              point: result[1],
              totalScore: result[2],
            ),
          );
        }
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF26957),
          boxShadow: [
            // ボタン下部
            BoxShadow(
              color: Color(0xFF854239),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/svg/adventure_button.svg",
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 15),
              child: BorderedText(
                strokeColor: Colors.white,
                strokeWidth: 3,
                child: const Text(
                  "ぼうけん",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFF26957),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
