import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';

class ShopButton extends StatelessWidget {
  const ShopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/shop');
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFFCD4E),
          boxShadow: [
            // ボタン下部
            BoxShadow(
              color: Color(0xFFC29217),
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 2),
              child: SvgPicture.asset(
                "assets/svg/shop_button.svg",
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 10),
              child: BorderedText(
                strokeColor: Colors.white,
                strokeWidth: 2,
                child: const Text(
                  "ショップ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFFA63E),
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
