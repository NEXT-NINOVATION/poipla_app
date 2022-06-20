import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';

class ChangeCostumeButton extends StatelessWidget {
  const ChangeCostumeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/change_costume');
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF94EDFF),
          boxShadow: [
            // ボタン下部
            BoxShadow(
              color: Color(0xFF76C8D9),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                "assets/svg/change_costume_button.svg",
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 10),
              child: BorderedText(
                strokeColor: Colors.white,
                strokeWidth: 2,
                child: const Text(
                  "きせかえ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF207CAF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
