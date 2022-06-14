import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/bubble.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Bubble(),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/speech_balloon.svg",
                      ),
                      const Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 28,
                          color: kFontColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    "assets/svg/fish.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
