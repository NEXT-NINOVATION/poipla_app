import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/game.dart';
import 'package:quiver/async.dart'; // ①quiver.asyncライブラリを利用

// This class represents the game over menu overlay.
class StartCountDown extends StatefulWidget {
  static const String id = 'StartCountDown';
  final AdventureGame gameRef;

  const StartCountDown({Key? key, required this.gameRef}) : super(key: key);

  @override
  State<StartCountDown> createState() => _StartCountDownState();
}

class _StartCountDownState extends State<StartCountDown> {
  // カウントを示すインスタンス変数
  int _start = 3;
  int _current = 3;
  bool _isStart = true;

  // ③ カウントダウン処理を行う関数を定義
  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start), //初期値
      new Duration(seconds: 1), // 減らす幅
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds; //毎秒減らしていく
      });
    });

    // 終了時の処理
    sub.onDone(() {
      sub.cancel();
      _current = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // widget.gameRef.pauseEngine();
    if (_isStart == true) {
      startTimer();
      _isStart = false;
    }
    if (_current == 0) {
      Future.delayed(const Duration(seconds: 1)).then((_) {
        widget.gameRef.overlays.remove(StartCountDown.id);
        widget.gameRef.resumeEngine();
      });
    }
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_current != 0) ...{
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/count$_current.png',
                  width: 150,
                ),
              ),
            } else ...{
              Image.asset(
                'assets/images/start_text.png',
                width: MediaQuery.of(context).size.width / 1.1,
              ),
              Image.asset(
                'assets/images/rule_text.png',
                width: MediaQuery.of(context).size.width / 1.3,
              ),
            }
          ],
        ),
      ),
    );
  }
}
