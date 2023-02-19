import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:audioplayers/audioplayers.dart';

class GachaModal extends StatefulWidget {
  GachaModal({Key? key}) : super(key: key);

  @override
  State<GachaModal> createState() => _GachaModalState();
}

class _GachaModalState extends State<GachaModal> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 53),
              const Text(
                "ごほうびをもらおう！",
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 20,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/speech_balloon.svg",
                            height: 150,
                            width: 260,
                          ),
                          const Text(
                            "ガチャをひこう！",
                            style: TextStyle(
                                fontSize: 24,
                                color: kFontColor,
                                fontFamily: 'Noto Sans JP',
                                fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 130,
                      child: SvgPicture.asset(
                        "assets/svg/fish_shark.svg",
                        height: 250,
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: () async {
                await soundEffect.resume();
                Navigator.pop(context);
              },
              child: SizedBox(
                width: deviceW * 0.5,
                child: const AppButton(text: "ガチャへ", isPos: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
