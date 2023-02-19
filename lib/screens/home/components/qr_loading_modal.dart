import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/entities/session/session.dart';
import 'package:poipla_app/providers/session_event_provider.dart';
import 'package:poipla_app/providers/session_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:audioplayers/audioplayers.dart';

class QRModalLoadingWidget extends StatelessWidget {
  const QRModalLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 88),
            SvgPicture.asset(
              "assets/svg/qr_loading.svg",
              height: 100,
              width: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 40),
              child: const Text("ちょっとまってね",
                  style: TextStyle(
                    color: Color(0xFF207CAF),
                    fontSize: 20,
                  )),
            ),
            SvgPicture.asset("assets/svg/fish_shark.svg",
                height: 250, width: 300),
          ],
        ),
      ],
    );
  }
}

class QRModalConnectedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 88),
            SvgPicture.asset(
              "assets/svg/qr_completed.svg",
              height: 100,
              width: 100,
            ),
            Container(
              margin: const EdgeInsets.only(top: 24, bottom: 40),
              child: const Text("ごみばことつながりました！",
                  style: TextStyle(
                    color: Color(0xFF207CAF),
                    fontSize: 20,
                  )),
            ),
            SvgPicture.asset("assets/svg/fish_shark.svg",
                height: 250, width: 300),
          ],
        ),
      ],
    );
  }
}

class QRModalCounterWidget extends ConsumerStatefulWidget {
  final Session session;
  final VoidCallback onGoToNextStep;

  const QRModalCounterWidget(
      {Key? key, required this.session, required this.onGoToNextStep})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return QRModalCounterWidgetState();
  }
}

class QRModalCounterWidgetState extends ConsumerState<QRModalCounterWidget> {
  bool isShowCounter = false;

  @override
  void initState() {
    _waitCounterScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final latestEvent =
        ref.watch(sessionCountEventStreamProvider(widget.session.dustBoxId));

    /// NOTE: 現在の個数
    final count = latestEvent.when(
        data: (d) {
          if (d.session.id != widget.session.id) {
            return 0;
          }
          return d.count;
        },
        error: (e, st) => 0,
        loading: () => 0);
    double deviceW = MediaQuery.of(context).size.width;

    if (!isShowCounter) {
      return QRModalConnectedWidget();
    }

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 53),
            const Text(
              "もっているプラごみをごみばこ\nにいれよう",
              style: TextStyle(
                color: kFontColor,
                fontSize: 20,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/speech_balloon.svg",
                          height: 150,
                          width: 260,
                        ),
                        Container(
                          // color: Colors.amber,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 17),
                                child: Text(
                                  "$count",
                                  style: const TextStyle(
                                    fontSize: 56,
                                    color: kFontColorImportant,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const Text(
                                "こいれたよ",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: kFontColor,
                                    fontFamily: 'Noto Sans JP',
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 110,
                    child: SvgPicture.asset(
                      "assets/svg/fish_shark.svg",
                      height: 250,
                      width: 300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 40),
          child: GestureDetector(
            onTap: () async {
              await soundEffect.resume();
              widget.onGoToNextStep();
            },
            child: SizedBox(
              width: deviceW * 0.5,
              child: const AppButton(text: "いれたよ！", isPos: true),
            ),
          ),
        ),
      ],
    );
  }

  void _waitCounterScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isShowCounter = true;
    });
  }
}

class BeforeGachaWidget extends ConsumerWidget {
  const BeforeGachaWidget({Key? key, required this.session}) : super(key: key);
  final Session session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceW = MediaQuery.of(context).size.width;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 53),
            const Text(
              "ごほうびをもらおう！",
              style: TextStyle(
                color: kFontColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 20,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/speech_balloon.svg",
                          height: 150,
                          width: 260,
                        ),
                        const Text(
                          "ガチャをひこう！",
                          style: TextStyle(
                              fontSize: 24,
                              color: kFontColor,
                              fontFamily: 'Noto Sans JP',
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 130,
                    child: SvgPicture.asset(
                      "assets/svg/fish_shark.svg",
                      height: 250,
                      width: 300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 40),
          child: GestureDetector(
            onTap: () async {
              await soundEffect.resume();
              ref
                  .read(sessionRepositoryProvider)
                  .complete(session)
                  .then((value) {
                Navigator.of(context).pop();
                GoRouter.of(context).push(
                    '/result_box/${session.dustBoxId}/clatter_result/${session.id}/animation');
              });
            },
            child: SizedBox(
              width: deviceW * 0.5,
              child: const AppButton(text: "ガチャへ", isPos: true),
            ),
          ),
        ),
      ],
    );
  }
}
