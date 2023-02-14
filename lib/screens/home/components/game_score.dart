import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';

class GameScore extends StatefulWidget {
  GameScore({
    Key? key,
    required this.totalPla,
  }) : super(key: key);

  final int totalPla;

  @override
  State<GameScore> createState() => _GameScoreState();
}

class _GameScoreState extends State<GameScore> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 154,
                height: 48,
                color: const Color(0xFFD2F4FF),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "あつめたプラのかず",
                        style: TextStyle(
                          color: Color(0xFF207CAF),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.totalPla}",
                            style: TextStyle(
                              color: kFontColorRed,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 3),
                            child: Text(
                              "こ",
                              style: TextStyle(
                                color: kFontColorRed,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -20,
                child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2D9DDC),
                    shape: BoxShape.circle,
                  ),
                  width: 56,
                  height: 56,
                  child: SvgPicture.asset(
                    "assets/svg/score_icon.svg",
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
