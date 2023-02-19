import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/bubble.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/tutorial/components/prologue_phase.dart';
import 'package:audioplayers/audioplayers.dart';

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends ConsumerState<TutorialScreen> {
  // TextFieldのキーボード表示用
  var focusNode = FocusNode();
  bool showTextFieldFlag = false;
  double bottomMargin = 120;
  bool bgKeyboardFlag = false;

  // 吹き出し表示/非表示フラグ
  bool showSpeechBalloonFlag = true;

  bool showPrologueFlag = false;

  String fishSvgName = "fish_default.svg";
  String buttonText = "こたえる";
  int index = 0;
  int funcKey = 0;

  final inputNameController = TextEditingController();

  bool isUserNameUpdated = false;

  callback(newFlag) {
    setState(() {
      showPrologueFlag = newFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(accountStoreProvider).currentUser;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);
    // セリフ
    List<String> wordsList = [
      "こんにちは、ぼくは\nスー。\nきみのおなまえは？",
      "${currentUser?.name}、よろしくね！\nじつは、${currentUser?.name}に\nおねがいがあるんだ…。",
      "おうちのうみが、毎日たくさ\nんのごみであふれて住みにく\nくなっちゃったんだ",
      "というわけで、ぼくといっ\nしょにうみをきれいにする\nお手伝いをしてほしいんだ！",
      "ありがとう！じゃあ、ぼくの\nおうちに案内するね。${currentUser?.name}、\nこれからよろしくね！",
    ];
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

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
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Bubble(),
                  SvgPicture.asset(
                    "assets/svg/$fishSvgName",
                    width: deviceW * 0.7,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100, left: 220),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              alignment: Alignment.topCenter,
              child: Visibility(
                visible: showSpeechBalloonFlag,
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
                        wordsList[index],
                        style: const TextStyle(
                          color: kFontColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: bgKeyboardFlag,
              child: Container(
                color: Colors.black38,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(bottom: bottomMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: showTextFieldFlag,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        width: deviceW * 0.7,
                        child: TextField(
                          focusNode: focusNode,
                          maxLength: 8,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          controller: inputNameController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "八文字まで入力可",
                            counterText: "",
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await soundEffect.resume();
                        if (funcKey == 1) {
                          ref
                              .read(accountStoreProvider)
                              .updateName(name: inputNameController.text)
                              .then((value) {
                            setState(() {
                              fishSvgName = "fish_worry.svg";
                              bottomMargin = 120;
                              showSpeechBalloonFlag = true;
                              showTextFieldFlag = false;
                              bgKeyboardFlag = false;
                              buttonText = "なあに？";
                              funcKey++;
                              index++;
                              isUserNameUpdated = true;
                            });
                          });
                          return;
                        }

                        setState(() {
                          if (!isUserNameUpdated && funcKey > 0) {
                            return;
                          }
                          if (funcKey == 0) {
                            bottomMargin = 50;
                            showSpeechBalloonFlag = false;
                            showTextFieldFlag = true;
                            bgKeyboardFlag = true;
                            buttonText = "これにする！";
                            funcKey++;
                          } else if (funcKey == 2) {
                            buttonText = "そうなの？";
                            funcKey++;
                            index++;
                          } else if (funcKey == 3) {
                            fishSvgName = "fish_default.svg";
                            buttonText = "いいよ！";
                            funcKey++;
                            index++;
                            showPrologueFlag = true;
                          } else if (funcKey == 4) {
                            buttonText = "よろしくね";
                            index = 4;
                            funcKey++;
                          } else {
                            ref.read(accountStoreProvider).completeTutorial();
                            GoRouter.of(context).go('/');
                          }
                        });
                        FocusScope.of(context).requestFocus(focusNode);
                      },
                      child: AppButton(
                        text: buttonText,
                        isPos: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: showPrologueFlag,
              child: ProloguePhase(
                callback: callback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
