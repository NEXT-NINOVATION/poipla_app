import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // ボタンデザインContainer
        Container(
          width: 136,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              // ボタンのシャドウ
              BoxShadow(
                color: Color(0xFFC29217),
                offset: Offset(0, 8),
              ),
              // ボタン
              BoxShadow(
                color: Color(0xFFFFCD4E),
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: kFontColor,
            ),
          ),
        ),
      ],
    );
  }
}
