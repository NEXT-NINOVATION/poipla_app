import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';

class ProloguePhase extends StatefulWidget {
  ProloguePhase({
    Key? key,
    required this.callback,
  }) : super(key: key);

  final Function callback;

  @override
  State<ProloguePhase> createState() => _ProloguePhaseState();
}

class _ProloguePhaseState extends State<ProloguePhase> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScrollEvent);
    super.initState();
  }

  void _onScrollEvent() {
    var currentPosition = _scrollController.position.pixels;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    if (maxScrollExtent == currentPosition) {
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ))
      widget.callback(false);
    }
    // print("Extent after: $currentPosition");
  }

  void dispose() {
    _scrollController.removeListener(_onScrollEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // デバイスサイズ
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kBgColorYellow,
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Container(
            margin: const EdgeInsets.only(top: 70, bottom: 70),
            width: deviceW * 0.9,
            height: 1100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: kBackgroundColors,
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent, //最後の要素の指定
                      duration: const Duration(seconds: 20),
                      curve: Curves.ease,
                    );
                  },
                  child: const Text("animation"),
                ),
                Column(
                  children: [
                    ClipPath(
                      clipper: CurveClipper(),
                      child: Container(
                        alignment: Alignment.center,
                        height: 220,
                        width: deviceW * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          child: const Text(
                            "プラスチックは正しく処理\nされないとごみとして\nのこりつづけるんだ。",
                            style: TextStyle(
                              color: kFontColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "きちんとごみをすてないと、\nぼくたちがおとなになるころ\nには、",
                      style: TextStyle(
                        color: kFontColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SvgPicture.asset("assets/svg/pet_bottle.svg"),
                    const SizedBox(height: 24),
                    const Text(
                      "うみがプラスチックごみで\nいっぱいになって…",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "ぼくたちのおうちが\nなくなっちゃうんだ！\nたすけて！",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/svg/bg_garbage.svg"),
                    Positioned(
                      bottom: 40,
                      child: SvgPicture.asset("assets/svg/fish_cry.svg"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40; //曲線の高さ

    Path path = Path();

    path.lineTo(0.0, size.height - 40);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height - curveHeight * 2,
      size.width * 0.5,
      size.height - curveHeight,
    );

    path.quadraticBezierTo(
      size.width - size.width * 0.25,
      size.height,
      size.width,
      size.height - 40,
    );

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
    //引数で親ウェジェットのサイズを取得できる
    //切り抜きの設定
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
