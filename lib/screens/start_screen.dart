import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/bubble.dart';
import 'package:poipla_app/screens/shop/shop_screen.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                Container(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/svg/start_banner.svg",
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 120),
              child: GestureDetector(
                onTap: () async {
                  await soundEffect.resume();
                  await ref.read(accountStoreProvider).register();
                  ref.refresh(shopCostumesFutureProvider);
                },
                child: const AppButton(
                  text: "はじめる",
                  isPos: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
