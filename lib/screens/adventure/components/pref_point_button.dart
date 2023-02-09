import 'package:flutter/material.dart';

class PrefPointButton extends StatelessWidget {
  const PrefPointButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 130, left: 5),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: const BoxDecoration(
              color: Color(0xFFF26957),
              shape: BoxShape.circle,
              boxShadow: [
                // ボタンのシャドウ
                BoxShadow(
                  color: Color(0xFF854239),
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 7,
              left: 7,
            ),
            width: 3,
            height: 3,
            decoration: const BoxDecoration(
              color: Color(0xFFFFF4D9),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
