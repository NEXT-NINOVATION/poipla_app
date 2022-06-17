import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';

class QRModal extends StatefulWidget {
  QRModal({Key? key}) : super(key: key);

  @override
  State<QRModal> createState() => _QRModalState();
}

class _QRModalState extends State<QRModal> {
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
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: SizedBox(
        width: deviceW,
        height: deviceH,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  const Text(
                    "ごみばこにちかづけてみよう！",
                    style: TextStyle(
                      fontSize: 20,
                      color: kFontColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Image.asset("assets/svg/qr.png"),
                ],
              ),
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
    );
  }
}
