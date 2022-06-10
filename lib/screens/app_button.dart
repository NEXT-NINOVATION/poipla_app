import 'package:flutter/material.dart';
import 'package:poipla_app/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // 文字列とボタンデザインをStackする
    return Stack(
      alignment: Alignment.center,
      children: [
        // ボタンデザインContainer
        Container(
          width: 220,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              // ボタン下部
              BoxShadow(
                color: Color(0xFFF0B215),
                offset: Offset(0, 8),
              ),
              // ボタン上部
              BoxShadow(
                color: Color(0xFFFFF4D9),
              ),
              // ボタン中部
              BoxShadow(
                color: Color(0xFFFFCD4E),
                blurRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          // 泡のデザイン
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20.0, top: 1.0),
                width: 15.0,
                height: 15.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF4D9),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10.0, top: 1.0),
                width: 8.0,
                height: 8.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFF4D9),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              color: kFontColor,
            ),
          ),
        )
      ],
    );
  }
}
