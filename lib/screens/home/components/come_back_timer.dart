import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';

class ComeBackTimer extends StatefulWidget {
  ComeBackTimer({Key? key}) : super(key: key);

  @override
  State<ComeBackTimer> createState() => _ComeBackTimerState();
}

class _ComeBackTimerState extends State<ComeBackTimer> {
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    int minutes = 10;
    String comebackTime = "18:30";

    return Container(
      margin: const EdgeInsets.only(bottom: 130),
      width: deviceW * 0.75,
      height: deviceH * 0.17,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "あと",
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 20,
                ),
              ),
              Text(
                "$minutes",
                style: const TextStyle(
                  color: kFontColorImportant,
                  fontSize: 20,
                ),
              ),
              const Text(
                "分でかえってくるよ",
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            comebackTime,
            style: const TextStyle(
              color: kFontColorImportant,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
