import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/bubble.dart';
import 'package:poipla_app/screens/tutorial/tutorial_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Bubble(),
                const SizedBox(height: 40),
                SvgPicture.asset(
                  "assets/svg/title.svg",
                ),
                const SizedBox(height: 40),
                Image.asset(
                  "assets/svg/banner_sample.png",
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorialScreen(),
                    ),
                  );
                },
                child: const AppButton(text: "はじめる"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
