import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/costume_provider.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/shop/shop_screen.dart';

class BuyModal extends ConsumerStatefulWidget {
  const BuyModal(
      {Key? key,
      required this.costumeId,
      required this.nowPoint,
      required this.costumeName,
      required this.imageName,
      required this.point})
      : super(key: key);

  final String costumeName, imageName;
  final int costumeId, point, nowPoint;

  @override
  ConsumerState<BuyModal> createState() => _BuyModalState();
}

class _BuyModalState extends ConsumerState<BuyModal> {
  bool isBought = false;
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;

    final soundEffect = AudioPlayer(playerId: "soundEffect");
    soundEffect.setSourceAsset("audio/button_press.mp3");
    soundEffect.setVolume(1.0);

    return Dialog(
      insetPadding: const EdgeInsets.only(
        bottom: 120,
        top: 80,
        left: 30,
        right: 30,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: isBought == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.costumeName,
                          style: TextStyle(fontSize: 20, color: kFontColor),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            "${widget.point}",
                            style: TextStyle(fontSize: 32, color: kFontColor),
                          ),
                        ),
                        const Text(
                          "ポイント",
                          style: TextStyle(fontSize: 20, color: kFontColor),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, bottom: 35),
                      child: SvgPicture.asset(
                          "assets/svg/${widget.imageName}.svg",
                          height: 180,
                          width: 180),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${widget.nowPoint}",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorImportant,
                              ),
                            ),
                            Text(
                              "ポイント",
                              style: TextStyle(
                                fontSize: 14,
                                color: kFontColor,
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 12, right: 12),
                          child: SvgPicture.asset("assets/svg/arrow_right.svg"),
                        ),
                        Row(
                          children: [
                            Text(
                              "${widget.nowPoint - widget.point}",
                              style: TextStyle(
                                fontSize: 24,
                                color: kFontColorImportant,
                              ),
                            ),
                            Text(
                              "ポイント",
                              style: TextStyle(
                                fontSize: 14,
                                color: kFontColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 25,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isBought = true;
                          });
                          await soundEffect.resume();
                          // await ref
                          //     .read(poiplaApiServiceProvider)
                          //     .buyShopCostume(widget.costumeId.toString());
                          await ref
                              .read(myCostumeStoreProvider)
                              .update(widget.costumeId);
                          await ref.read(accountStoreProvider).fetch();
                          ref.refresh(shopCostumesFutureProvider);
                          // Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: SizedBox(
                          width: deviceW * 0.6,
                          child: const AppButton(text: "かう！", isPos: true),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          await soundEffect.resume();
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          width: deviceW * 0.45,
                          child: const AppButton(text: "やめる", isPos: false),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : _BoughtModal(
              widget: widget, soundEffect: soundEffect, deviceW: deviceW),
    );
  }
}

class _BoughtModal extends StatelessWidget {
  const _BoughtModal({
    super.key,
    required this.widget,
    required this.soundEffect,
    required this.deviceW,
  });

  final BuyModal widget;
  final AudioPlayer soundEffect;
  final double deviceW;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 24),
        const Text(
          "ゲットしたよ！",
          style: TextStyle(fontSize: 24, color: kFontColorImportant),
        ),
        const Text(
          "いますぐきせかえする？",
          style: TextStyle(fontSize: 20, color: kFontColor),
        ),
        Lottie.asset("assets/animation/fish_${widget.imageName}.json"),
        Container(
          margin: const EdgeInsets.only(
            bottom: 25,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  await soundEffect.resume();
                  Navigator.popUntil(context, (route) => route.isFirst);
                  GoRouter.of(context).push('/change_costume');
                },
                child: SizedBox(
                  width: deviceW * 0.6,
                  child: const AppButton(text: "きせかえする", isPos: true),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  await soundEffect.resume();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: deviceW * 0.45,
                  child: const AppButton(text: "おうちへ", isPos: false),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
