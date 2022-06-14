import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/bubble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/screens/app_button.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  // TextFieldのキーボード表示用
  var focusNode = FocusNode();
  bool showTextFieldFlag = false;
  double bottomMargin = 120;

  // 吹き出し表示/非表示フラグ
  bool showSpeechBalloonFlag = true;

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: kBackgroundColors,
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/fish.svg",
                    width: deviceW * 0.7,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100, left: 220),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              alignment: Alignment.topCenter,
              child: Visibility(
                visible: showSpeechBalloonFlag,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/speech_balloon.svg",
                      width: deviceW * 0.9,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        "こんにちは、ぼくは\n〇〇。\nきみのおなまえは？",
                        style: TextStyle(
                          color: kFontColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Bubble(),
                Container(
                  margin: EdgeInsets.only(bottom: bottomMargin),
                  child: Column(
                    children: [
                      // Visibility(
                      //   visible: showTextFieldFlag,
                      //   child: Container(
                      //     margin: const EdgeInsets.only(bottom: 40),
                      //     width: deviceW * 0.7,
                      //     child: TextField(
                      //       focusNode: focusNode,
                      //       maxLength: 8,
                      //       maxLengthEnforcement: MaxLengthEnforcement.none,
                      //       decoration: const InputDecoration(
                      //         border: InputBorder.none,
                      //         filled: true,
                      //         fillColor: Colors.white,
                      //         hintText: "八文字まで入力可",
                      //         counterText: "",
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   bottomMargin = 40;
                          //   showSpeechBalloonFlag = false;
                          //   showTextFieldFlag = true;
                          // });
                          // FocusScope.of(context).requestFocus(focusNode);
                        },
                        child: const AppButton(text: "こたえる"),
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
