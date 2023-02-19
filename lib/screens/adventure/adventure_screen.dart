import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/adventure/components/detail_modal.dart';
import 'package:poipla_app/screens/adventure/components/pref_point_button.dart';
import 'package:poipla_app/screens/adventure/components/result_modal.dart';
import 'package:poipla_app/screens/custom_back_button.dart';
import 'package:audioplayers/audioplayers.dart';

class AdventureScreen extends StatefulWidget {
  AdventureScreen({Key? key}) : super(key: key);

  @override
  State<AdventureScreen> createState() => _AdventureScreenState();
}

class _AdventureScreenState extends State<AdventureScreen> {
  @override
  Widget build(BuildContext context) {
    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Container(
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
        appBar: AppBar(
          title: Text(
            "ぼうけんにいく",
            style: const TextStyle(
              color: kAppBarFontColor,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
          leading: const CustomBackButton(),
          leadingWidth: 80,
        ),
        // 都道府県分まわす処理追加する
        body: InteractiveViewer(
            minScale: 0.1,
            maxScale: 5,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(50),
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/svg/japan_map.svg"),
                    GestureDetector(
                      onTap: () async {
                        await soundEffect.resume();
                        showDialog(
                          // Dialogの周囲の黒い部分をタップしても閉じないようにする
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => const DetailModal(
                            prefName: "愛知県",
                            kana: "あいちけん",
                            earnPoint: 50,
                            costumeName: "シャチホコ",
                          ),
                        );
                      },
                      // 座標的なのを引数で渡す
                      child: const PrefPointButton(
                          top: 130,
                          left: 5,
                          bottom: 0,
                          right: 0,
                          isEnter: true),
                    ),
                    PrefPointButton(
                        top: 130,
                        left: 5,
                        bottom: 0,
                        right: 80,
                        isEnter: false),
                    PrefPointButton(
                        top: 130,
                        left: 170,
                        bottom: 200,
                        right: 0,
                        isEnter: false),
                    PrefPointButton(
                        top: 50,
                        left: 160,
                        bottom: 0,
                        right: 0,
                        isEnter: false),
                    PrefPointButton(
                        top: 170,
                        left: 0,
                        bottom: 0,
                        right: 280,
                        isEnter: false),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
