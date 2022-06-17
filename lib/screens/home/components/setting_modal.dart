import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/home/components/service_button.dart';
import 'package:poipla_app/screens/home/components/sound_icon.dart';

class SettingModal extends StatefulWidget {
  SettingModal({Key? key}) : super(key: key);

  @override
  State<SettingModal> createState() => _SettingModalState();
}

class _SettingModalState extends State<SettingModal> {
  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ), //this right here
      child: SizedBox(
        width: deviceW,
        height: deviceH,
        child: Container(
          color: Colors.black54,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "おなまえの変更",
                        style: TextStyle(
                          fontSize: 18,
                          color: kFontColor,
                        ),
                      ),
                      SizedBox(
                        width: deviceW * 0.75,
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kFontColor,
                          ),
                          maxLength: 8,
                          maxLengthEnforcement: MaxLengthEnforcement.none,
                          controller: TextEditingController(text: "kokoko"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF5F5F5),
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BGMの音量",
                        style: TextStyle(
                          fontSize: 18,
                          color: kFontColor,
                        ),
                      ),
                      SizedBox(
                        width: deviceW * 0.75,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20,
                              width: 196,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFA63E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SoundIcon(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "その他",
                        style: TextStyle(
                          fontSize: 18,
                          color: kFontColor,
                        ),
                      ),
                      SizedBox(
                        width: deviceW * 0.75,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                ServiceButton(
                                  text: "あそびかた",
                                ),
                                SizedBox(width: 8),
                                ServiceButton(
                                  text: "利用規約",
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                ServiceButton(
                                  text: "お問い合わせ",
                                ),
                                SizedBox(width: 8),
                                ServiceButton(
                                  text: "データ引き継ぎ",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AppButton(text: "とじる", isPos: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
