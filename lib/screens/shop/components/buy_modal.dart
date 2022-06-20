import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:ruby_text/ruby_text.dart';

class BuyModal extends StatelessWidget {
  const BuyModal(
      {Key? key,
      required this.nowPoint,
      required this.costumeName,
      required this.imageName,
      required this.point})
      : super(key: key);

  final String costumeName, imageName;
  final int point, nowPoint;

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Dialog(
      insetPadding: const EdgeInsets.only(
        bottom: 120,
        top: 80,
        left: 30,
        right: 30,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    costumeName,
                    style: TextStyle(fontSize: 20, color: kFontColor),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      "$point",
                      style: TextStyle(fontSize: 32, color: kFontColor),
                    ),
                  ),
                  const Text(
                    "ポイント",
                    style: TextStyle(fontSize: 20, color: kFontColor),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 35),
                child: SvgPicture.asset("assets/svg/$imageName",
                    height: 180, width: 180),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "$nowPoint",
                        style: TextStyle(
                          fontSize: 24,
                          color: kFontColorImportant,
                        ),
                      ),
                      Text(
                        "ポイント",
                        style: TextStyle(
                          fontSize: 14,
                          color: kFontColor,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    child: SvgPicture.asset("assets/svg/arrow_right.svg"),
                  ),
                  Row(
                    children: [
                      Text(
                        "${nowPoint - point}",
                        style: TextStyle(
                          fontSize: 24,
                          color: kFontColorImportant,
                        ),
                      ),
                      Text(
                        "ポイント",
                        style: TextStyle(
                          fontSize: 14,
                          color: kFontColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 25,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: SizedBox(
                    width: deviceW * 0.6,
                    child: const AppButton(text: "かう！", isPos: true),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: deviceW * 0.45,
                    child: const AppButton(text: "やめる", isPos: false),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
