import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/database.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/gacha_result/components/result_detail_modal.dart';

class GachaResultScreen extends StatefulWidget {
  const GachaResultScreen({Key? key}) : super(key: key);

  @override
  State<GachaResultScreen> createState() => _GachaResultScreenState();
}

class _GachaResultScreenState extends State<GachaResultScreen> {
  bool isVisible = true;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    int count = 1;

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
          body: Visibility(
            visible: isVisible,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: deviceH * 0.3,
                            width: deviceW * 0.8,
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              "assets/svg/${sample_list[index].image}",
                            ),
                          ),
                          Positioned(
                            top: -40,
                            left: -20,
                            child: SvgPicture.asset(
                              "assets/svg/kirakira2.svg",
                              height: 84,
                              width: 84,
                            ),
                          ),
                          Positioned(
                            bottom: -25,
                            right: -5,
                            child: SvgPicture.asset(
                              "assets/svg/kirakira2.svg",
                              height: 84,
                              width: 84,
                            ),
                          ),
                          Positioned(
                            bottom: 35,
                            left: 10,
                            child: SvgPicture.asset(
                              "assets/svg/kirakira1.svg",
                              height: 40,
                              width: 40,
                            ),
                          ),
                          Positioned(
                            top: -20,
                            right: -10,
                            child: SvgPicture.asset(
                              "assets/svg/kirakira1.svg",
                              height: 75,
                              width: 75,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 50, bottom: 24),
                          child: count == 2
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    BorderedText(
                                      child: Text(
                                        sample_list[index].name,
                                        style: const TextStyle(
                                            color: Color(0xFFFFA63E),
                                            fontSize: 40),
                                      ),
                                      strokeWidth: 15,
                                      strokeColor: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 12),
                                      child: BorderedText(
                                        child: Text(
                                          "(" + sample_list[index].type + ")",
                                          style: const TextStyle(
                                            color: Color(0xFFFFA63E),
                                            fontSize: 24,
                                          ),
                                        ),
                                        strokeWidth: 15,
                                        strokeColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    BorderedText(
                                      child: Text(
                                        sample_list[index].name,
                                        style: const TextStyle(
                                            color: Color(0xFFFFA63E),
                                            fontSize: 35),
                                      ),
                                      strokeWidth: 15,
                                      strokeColor: Colors.white,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 12),
                                      child: BorderedText(
                                        child: Text(
                                          "(" + sample_list[index].type + ")",
                                          style: const TextStyle(
                                            color: Color(0xFFFFA63E),
                                            fontSize: 18,
                                          ),
                                        ),
                                        strokeWidth: 15,
                                        strokeColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                      Text(
                        sample_list[index].commentary,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                count == 2
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 120),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isVisible = false;
                            });
                            showDialog(
                              // Dialogの周囲の黒い部分をタップしても閉じないようにする
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) =>
                                  ResultDetailModal(),
                            );
                          },
                          child: const AppButton(
                            text: "すすむ",
                            isPos: true,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (index < sample_list.length - 1) {
                                setState(() {
                                  index++;
                                });
                              } else {
                                setState(() {
                                  isVisible = false;
                                });
                                showDialog(
                                  // Dialogの周囲の黒い部分をタップしても閉じないようにする
                                  barrierDismissible: false,

                                  context: context,
                                  builder: (BuildContext context) =>
                                      ResultDetailModal(),
                                );
                              }
                            },
                            child: const AppButton(
                              text: "つぎへ",
                              isPos: true,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            margin: const EdgeInsets.only(bottom: 35),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = false;
                                });

                                showDialog(
                                  // Dialogの周囲の黒い部分をタップしても閉じないようにする
                                  barrierDismissible: false,

                                  context: context,
                                  builder: (BuildContext context) =>
                                      ResultDetailModal(),
                                );
                              },
                              child: SizedBox(
                                width: deviceW * 0.45,
                                child: const AppButton(
                                  text: "スキップ",
                                  isPos: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )),
    );
  }
}
