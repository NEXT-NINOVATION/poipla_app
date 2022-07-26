import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:video_player/video_player.dart';

class GachaAnimationScreen extends StatefulWidget {
  const GachaAnimationScreen({
    Key? key,
    required this.sessionId,
    required this.boxId,
  }) : super(key: key);
  final int sessionId;
  final int boxId;

  @override
  State<GachaAnimationScreen> createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen> {
  late VideoPlayerController _controller;
  late VoidCallback _listener;

  bool _isPlayComplete = false;

  @override
  void initState() {
    _controller =
        VideoPlayerController.asset('assets/animation/gacha_animation.mp4');
    _controller.initialize().then((_) {
      // 最初のフレームを描画するため初期化後に更新
      setState(() {});

      _listener = () {
        if (!_controller.value.isPlaying && !_isPlayComplete) {
          _isPlayComplete = true;
          GoRouter.of(context).push(
              '/result_box/${widget.boxId}/clatter_result/${widget.sessionId}');
        }
      };
      _controller.addListener(_listener);
      super.initState();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: kBackgroundColors,
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // 動画を表示
              child: VideoPlayer(_controller),
            ),
            isShow == true
                ? Positioned(
                    bottom: 144,
                    child: GestureDetector(
                      onTap: () {
                        // 動画を再生
                        _controller.play();
                        setState(() {
                          isShow = false;
                        });
                      },
                      child: const AppButton(text: "あける", isPos: true),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
