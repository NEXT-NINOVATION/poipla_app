import 'dart:math';

import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRModal extends StatefulWidget {
  QRModal({Key? key}) : super(key: key);

  @override
  State<QRModal> createState() => _QRModalState();
}

class _QRModalState extends State<QRModal> {
  final qrKey = GlobalKey(debugLabel: 'QrCodeKey');
  @override
  Widget build(BuildContext context) {

    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    var scanArea = min(deviceW, deviceH) / 2;


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
                  Expanded(
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                          borderColor: Colors.red,
                          borderRadius: 10,
                          borderLength: 30,
                          borderWidth: 10,
                          cutOutSize: scanArea),
                      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                    ),
                  ),

                  // Image.asset("assets/svg/qr.png"),
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

  void _onQRViewCreated(QRViewController controller) {
    // setState(() {
    //   // this.controller = controller;
    // });
    // controller.scannedDataStream.listen((scanData) {
    //   // setState(() {
    //   //   result = scanData;
    //   // });
    // });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    // log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

}
