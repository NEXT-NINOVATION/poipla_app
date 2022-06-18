import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/leave_screen.dart';
import 'package:poipla_app/screens/app_button.dart';

class DetailModal extends StatelessWidget {
  const DetailModal({
    Key? key,
    required this.prefName,
    required this.kana,
    required this.earnPoint,
    required this.costumeName,
  }) : super(key: key);

  final String prefName, kana, costumeName;
  final int earnPoint;
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: SizedBox(
        width: deviceW,
        height: deviceH,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    kana,
                    style: const TextStyle(
                      fontSize: 14,
                      color: kFontColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Text(
                    prefName,
                    style: const TextStyle(
                      fontSize: 24,
                      color: kFontColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          Text(
                            "$earnPoint",
                            style: const TextStyle(
                              fontSize: 24,
                              color: kFontColorImportant,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const Text(
                            "ポイントゲット！",
                            style: TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          const Text(
                            "けいけんちゲット！",
                            style: TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/check.svg",
                            color: kIconColor,
                          ),
                          Text(
                            "「$costumeName」もらえるかも？",
                            style: const TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/svg/shachihoko.png",
                      width: deviceW * 0.45,
                    ),
                  ),
                  const Text(
                    "〇〇がかえってくるじかん",
                    style: TextStyle(
                      fontSize: 16,
                      color: kFontColor,
                      letterSpacing: 2.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: const Text(
                      "18:30",
                      style: TextStyle(
                        fontSize: 40,
                        color: kFontColorImportant,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: deviceW * 0.6,
                  margin: const EdgeInsets.only(bottom: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeaveScreen(),
                        ),
                      );
                    },
                    child: const AppButton(text: "ぼうけんする", isPos: true),
                  ),
                ),
                Container(
                  width: deviceW * 0.45,
                  margin: const EdgeInsets.only(bottom: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const AppButton(text: "とじる", isPos: false),
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
