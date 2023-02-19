import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';
import 'package:poipla_app/providers/clatter_result_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/gacha_result/components/result_detail_modal.dart';
import 'package:audioplayers/audioplayers.dart';

class GachaResultScreen extends ConsumerStatefulWidget {
  const GachaResultScreen({
    Key? key,
    required this.boxId,
    required this.sessionId,
  }) : super(key: key);
  final int boxId;
  final int sessionId;

  @override
  ConsumerState<GachaResultScreen> createState() => _GachaResultScreenState();
}

class _GachaResultScreenState extends ConsumerState<GachaResultScreen> {
  bool isVisible = true;
  int index = 0;
  bool isLoading = false;
  List<Costume> costumes = [];
  List<ClatterResult> results = [];

  @override
  void initState() {
    ref
        .read(clatterResultRepositoryProvider)
        .findBy(dustBoxId: widget.boxId, sessionId: widget.sessionId)
        .then(_onClatterResultLoaded);
    super.initState();
  }

  void _onClatterResultLoaded(List<ClatterResult> results) {
    final filteredCostumes =
        results.map((e) => e.costume).whereType<Costume>().toList();
    if (filteredCostumes.isEmpty) {
      _showResultModal(results);
    }
    setState(() {
      isLoading = true;
      costumes = filteredCostumes;
      this.results = results;
    });
  }

  void _showResultModal(List<ClatterResult> results) {
    showDialog(
      // Dialogの周囲の黒い部分をタップしても閉じないようにする
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ResultDetailModal(results: results),
    );
  }

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

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
          body: costumes.isEmpty
              ? Container()
              : Visibility(
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
                                    "assets/svg/${costumes[index].image}.svg",
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
                                margin:
                                    const EdgeInsets.only(top: 50, bottom: 24),
                                child: costumes.length == 1
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          BorderedText(
                                            child: Text(
                                              costumes[index].costumeName,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFA63E),
                                                  fontSize: 40),
                                            ),
                                            strokeWidth: 15,
                                            strokeColor: Colors.white,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 12),
                                            child: BorderedText(
                                              child: Text(
                                                "(" +
                                                    costumes[index].animalType +
                                                    ")",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          BorderedText(
                                            child: Text(
                                              costumes[index].costumeName,
                                              style: const TextStyle(
                                                  color: Color(0xFFFFA63E),
                                                  fontSize: 35),
                                            ),
                                            strokeWidth: 15,
                                            strokeColor: Colors.white,
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 12),
                                            child: BorderedText(
                                              child: Text(
                                                "(" +
                                                    costumes[index].animalType +
                                                    ")",
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
                              costumes[index].description ?? '',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      costumes.length == 1
                          ? Container(
                              margin: const EdgeInsets.only(bottom: 120),
                              child: GestureDetector(
                                onTap: () async {
                                  await soundEffect.resume();
                                  setState(() {
                                    isVisible = false;
                                  });
                                  _showResultModal(results);
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
                                  onTap: () async {
                                    await soundEffect.resume();
                                    if (index < costumes.length - 1) {
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
                                            ResultDetailModal(results: results),
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
                                    onTap: () async {
                                      await soundEffect.resume();
                                      setState(() {
                                        isVisible = false;
                                      });

                                      showDialog(
                                        // Dialogの周囲の黒い部分をタップしても閉じないようにする
                                        barrierDismissible: false,

                                        context: context,
                                        builder: (BuildContext context) =>
                                            ResultDetailModal(results: results),
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
