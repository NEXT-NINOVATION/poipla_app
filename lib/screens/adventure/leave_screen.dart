import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/bubble.dart';

class LeaveScreen extends StatefulWidget {
  LeaveScreen({Key? key}) : super(key: key);

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
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
              const SizedBox(
                // Fix
                height: 200,
                child: Bubble(),
              ),
              SizedBox(
                width: deviceW,
                height: deviceH,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 90),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/speech_balloon.svg",
                            width: deviceW * 0.9,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "〇〇〇〇、\nいってきまーす！！！",
                              style: const TextStyle(
                                color: kFontColor,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 120),
                      child: GestureDetector(
                        onTap: () {
                          int count = 0;
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const AppButton(text: "おうちにもどる", isPos: true),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/svg/fish_default.svg",
                  width: deviceW * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
