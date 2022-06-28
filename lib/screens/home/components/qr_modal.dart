import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/entities/session/session.dart';
import 'package:poipla_app/providers/session_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRModal extends ConsumerStatefulWidget {
  const QRModal({Key? key}) : super(key: key);

  @override
  ConsumerState<QRModal> createState() => _QRModalState();
}

/// 現在の状態を表す
/// scanning: QRコードのスキャンを待ち受けている状態
/// sessionCreating: セッションの開始をリクエストしている状態
/// sessionCreated: セッションが作成された状態
/// sessionFinished: セッションが完了した状態
enum StateType {
  scanning,
  sessionCreating,
  sessionCreated,
  sessionFinished,
}

class _QRModalState extends ConsumerState<QRModal> {
  final qrKey = GlobalKey(debugLabel: 'QrCodeKey');

  QRViewController? _qrViewController;

  StateType type = StateType.scanning;
  Session? session;

  Widget _buildQrScanner(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    var scanArea = min(deviceW, deviceH) / 2;
    return Stack(
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
                  onPermissionSet: (ctrl, p) =>
                      _onPermissionSet(context, ctrl, p),
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
    );
  }

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
          child: () {
            if (type == StateType.scanning) {
              return _buildQrScanner(context);
            }
            if (type == StateType.sessionCreating) {
              return const Text('セッション作成中');
            }
            if (type == StateType.sessionCreated) {
              return const Text('スキャン完了');
            }
            return const Text('???');
          }()),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController?.scannedDataStream.listen((event) {
      // TODO(pantasystem): セッション開始処理を行う
      if (type != StateType.scanning) {
        return;
      }
      final dustBoxId = int.tryParse(event.code ?? '');

      setState(() {
        type = StateType.sessionCreating;
      });
      ref
          .read(sessionRepositoryProvider)
          .create(dustBoxId: dustBoxId ?? -1)
          .then((value) {
        setState(() {
          type = StateType.sessionCreated;
          session = value;
        });
      }).onError((error, stackTrace) {
        setState(() {
          type = StateType.scanning;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('無効なQRコードです。')));
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }
}
