import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFCD4E),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFF4D9),
                width: 2,
              ),
            ),
          ),
          SvgPicture.asset(
            "assets/svg/setting.svg",
            width: 24,
            height: 24,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, left: 20),
            alignment: Alignment.topRight,
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: Color(0xFFFFF4D9),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
