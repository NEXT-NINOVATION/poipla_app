import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';

class AdventureButton extends StatelessWidget {
  const AdventureButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/adventure');
      },
      child: Container(
        width: 120,
        height: 120,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFF26957),
          boxShadow: [
            // ボタン下部
            BoxShadow(
              color: Color(0xFF854239),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 15),
              child: SvgPicture.asset(
                "assets/svg/adventure_button.svg",
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 15),
              child: BorderedText(
                strokeColor: Colors.white,
                strokeWidth: 3,
                child: const Text(
                  "ぼうけん",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFF26957),
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
