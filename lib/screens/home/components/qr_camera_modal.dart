import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/entities/session/session.dart';
import 'package:poipla_app/providers/session_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/home/components/qr_loading_modal.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCameraModal extends ConsumerStatefulWidget {
  const QRCameraModal({Key? key}) : super(key: key);

  @override
  ConsumerState<QRCameraModal> createState() => _QRCameraModalState();
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

class _QRCameraModalState extends ConsumerState<QRCameraModal> {
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
              Container(
                width: deviceW * 0.8,
                height: deviceW * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF207CAF), width: 9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: const Color(0xFF207CAF),
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: scanArea,
                  ),
                  onPermissionSet: (ctrl, p) =>
                      _onPermissionSet(context, ctrl, p),
                ),
              ),
              const SizedBox(height: 100),
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
            child: const AppButton(text: "やめる", isPos: false),
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
    // var scanArea = min(deviceW, deviceH) / 2;

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
              return QRModalLoadingWidget();
            }
            if (type == StateType.sessionCreated) {
              return QRModalCounterWidget(
                  session: session!,
                  onGoToNextStep: () {
                    setState(() {
                      type = StateType.sessionFinished;
                    });
                  });
            }
            return BeforeGachaWidget();
          }()),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController?.scannedDataStream.listen((event) {
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
      }).catchError((error, stackTrace) {
        dev.log('failure session create', error: error, stackTrace: stackTrace);
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
