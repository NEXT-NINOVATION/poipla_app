import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poipla_app/screens/home/components/gacha_modal.dart';

class QRLoadingModal extends StatefulWidget {
  QRLoadingModal({Key? key}) : super(key: key);

  @override
  State<QRLoadingModal> createState() => _QRLoadingModalState();
}

class _QRLoadingModalState extends State<QRLoadingModal> {
  int index = 0;
  int sum = 0;
  @override
  Widget build(BuildContext context) {
    bool isConnected = true;
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
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
      child: (() {
        switch (index) {
          case 0:
            return Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 88),
                    isConnected == true
                        ? SvgPicture.asset(
                            "assets/svg/qr_completed.svg",
                            height: 100,
                            width: 100,
                          )
                        : SvgPicture.asset(
                            "assets/svg/qr_loading.svg",
                            height: 100,
                            width: 100,
                          ),
                    isConnected == true
                        ? Container(
                            margin: const EdgeInsets.only(top: 24, bottom: 40),
                            child: const Text("ごみばことつながりました！",
                                style: TextStyle(
                                  color: Color(0xFF207CAF),
                                  fontSize: 20,
                                )),
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 24, bottom: 40),
                            child: const Text("ちょっとまってね",
                                style: TextStyle(
                                  color: Color(0xFF207CAF),
                                  fontSize: 20,
                                )),
                          ),
                    SvgPicture.asset("assets/svg/fish_shark.svg",
                        height: 250, width: 300),
                  ],
                ),
              ],
            );
          case 1:
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 53),
                    const Text(
                      "もっているプラごみをごみばこ\nにいれよう",
                      style: TextStyle(
                        color: kFontColor,
                        fontSize: 20,
                        height: 1.8,
                      ),
                    ),
                    SizedBox(height: 10),
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
                                Container(
                                  // color: Colors.amber,
                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 17),
                                        child: Text(
                                          "$sum",
                                          style: const TextStyle(
                                            fontSize: 56,
                                            color: kFontColorImportant,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        "こいれたよ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: kFontColor,
                                            fontFamily: 'Noto Sans JP',
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 110,
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
                    onTap: () {
                      setState(() {
                        index = 2;
                        print(index);
                      });
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => GachaModal(),
                      //   ),
                      // );
                      // Navigator(
                      //   onGenerateRoute: (context) =>
                      //       MaterialPageRoute<GachaModal>(
                      //     builder: (context) => GachaModal(),
                      //   ),
                      // );
                    },
                    child: SizedBox(
                      width: deviceW * 0.5,
                      child: const AppButton(text: "いれたよ！", isPos: true),
                    ),
                  ),
                ),
              ],
            );
          case 2:
            return Stack(
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
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: deviceW * 0.5,
                      child: const AppButton(text: "ガチャへ", isPos: true),
                    ),
                  ),
                ),
              ],
            );
          default:
        }
      })(),
    );
  }
}
