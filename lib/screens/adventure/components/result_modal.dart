import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/game/models/character_details.dart';
import 'package:poipla_app/screens/adventure/game/models/player_data.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:poipla_app/screens/app_button.dart';

class ResultModal extends StatefulWidget {
  const ResultModal({
    Key? key,
    required this.pla,
    required this.point,
    required this.totalScore,
  }) : super(key: key);

  final int pla, point, totalScore;

  @override
  State<ResultModal> createState() => _ResultModalState();
}

class _ResultModalState extends State<ResultModal> {
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
          // alignment: Alignment.center,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFA63E),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                    ),
                    const Text(
                      "きれいになったよ！",
                      style: TextStyle(
                        color: kAppBarFontColor,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "ひろったごみ",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorRed,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.pla}",
                            style: TextStyle(
                              fontSize: 56,
                              color: kFontColorRed,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              "こ",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 60,
                        thickness: 1,
                        indent: 52,
                        endIndent: 52,
                        color: Colors.black38,
                      ),
                      const Text(
                        "ポイントゲット！",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorImportant,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.point}",
                            style: TextStyle(
                              fontSize: 56,
                              color: kFontColorImportant,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 14),
                            child: Text(
                              "ポイント",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 60,
                        thickness: 1,
                        indent: 52,
                        endIndent: 52,
                        color: Colors.black38,
                      ),
                      const Text(
                        "いままでのハイスコア",
                        style: TextStyle(
                          fontSize: 16,
                          color: kFontColorBlue,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.totalScore}",
                            style: TextStyle(
                              fontSize: 40,
                              color: kFontColorBlue,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            child: const Text(
                              "こ",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 50),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
