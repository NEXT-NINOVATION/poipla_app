import 'package:flutter/material.dart';

class PrefPointButton extends StatelessWidget {
  const PrefPointButton({
    required this.top,
    required this.left,
    required this.bottom,
    required this.right,
    required this.isEnter,
    Key? key,
  }) : super(key: key);

  final double top, left, bottom, right;
  final bool isEnter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: left,
        bottom: bottom,
        right: right,
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color:
                  isEnter ? const Color(0xFFF26957) : const Color(0xFF7B7B7B),
              shape: BoxShape.circle,
              boxShadow: [
                // ボタンのシャドウ
                BoxShadow(
                  color: isEnter
                      ? const Color(0xFF854239)
                      : const Color(0xFF505050),
                  offset: const Offset(0, 1.5),
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
