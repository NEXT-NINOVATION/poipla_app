import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QRCompletedModal extends StatefulWidget {
  QRCompletedModal({Key? key}) : super(key: key);

  @override
  State<QRCompletedModal> createState() => _QRCompletedModalState();
}

class _QRCompletedModalState extends State<QRCompletedModal> {
  @override
  Widget build(BuildContext context) {
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
      ),
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 88),
              SvgPicture.asset("assets/svg/qr_completed.svg",
                  height: 100, width: 100),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 40),
                child: const Text(
                  "ごみばことつながりました！",
                  style: TextStyle(
                    color: Color(0xFF207CAF),
                    fontSize: 20,
                  ),
                ),
              ),
              SvgPicture.asset("assets/svg/fish_shark.svg",
                  height: 250, width: 300),
            ],
          ),
        ],
      ),
    );
  }
}
