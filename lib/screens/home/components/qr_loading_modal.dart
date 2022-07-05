import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QRLoadingModal extends StatefulWidget {
  QRLoadingModal({Key? key}) : super(key: key);

  @override
  State<QRLoadingModal> createState() => _QRLoadingModalState();
}

class _QRLoadingModalState extends State<QRLoadingModal> {
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
              // const SpinKitFadingCircle(
              //   color: Colors.blue,
              //   size: 100,
              //   // controller: AnimationController(
              //   //   vsync: this,
              //   //   duration: const Duration(milliseconds: 1200),
              //   // ),
              //   // itemBuilder: (BuildContext context, int index) {
              //   //   return DecoratedBox(
              //   //     decoration: BoxDecoration(
              //   //       color: Colors.blue,
              //   //     ),
              //   //   );
              //   // },
              // ),
              SizedBox(height: 88),
              SvgPicture.asset(
                "assets/svg/qr_lodaing.svg",
                height: 100,
                width: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 40),
                child: const Text(
                  "ちょっとまってね",
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
