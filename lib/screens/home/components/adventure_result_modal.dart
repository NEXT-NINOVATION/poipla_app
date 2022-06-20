import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:ruby_text/ruby_text.dart';

class AdventureResultModal extends StatelessWidget {
  const AdventureResultModal({
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
        borderRadius: BorderRadius.circular(32.0),
      ), //this right here
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
                  Container(
                    width: deviceW * 0.6,
                    child: RubyText(
                      [
                        RubyTextData(
                          prefName,
                          ruby: kana,
                          style: const TextStyle(
                            fontSize: 24,
                            color: kFontColor,
                            letterSpacing: 2.0,
                          ),
                          rubyStyle: const TextStyle(
                            fontSize: 14,
                            color: kFontColor,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const RubyTextData(
                          "がきれいに",
                          style: TextStyle(
                            fontSize: 24,
                            color: kFontColor,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const RubyTextData(
                          "なったよ！",
                          style: TextStyle(
                            fontSize: 24,
                            color: kFontColor,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: deviceW * 0.6,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: deviceW * 0.45,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFE6A6),
                              ),
                            ),
                            Container(
                              width: (deviceW * 0.5) / 1.3,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFA63E),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "レベル",
                                  style: TextStyle(
                                    color: Color(0xFFC29217),
                                    fontSize: 12,
                                    letterSpacing: 2,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 17),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFFCD4E),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Text(
                                        "1",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xFFC29217),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "レベル",
                                  style: TextStyle(
                                    color: Color(0xFFC29217),
                                    fontSize: 12,
                                    letterSpacing: 2,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 17),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFFCD4E),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0xFFC29217),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
                          const Text(
                            "「",
                            style: TextStyle(
                              fontSize: 16,
                              color: kFontColor,
                              letterSpacing: 2.0,
                            ),
                          ),
                          Text(
                            costumeName,
                            style: const TextStyle(
                              fontSize: 16,
                              color: kFontColorImportant,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const Text(
                            "」ゲット！",
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
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Image.asset(
                      "assets/svg/castle.png",
                      width: deviceW * 0.6,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
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
      ),
    );
  }
}
