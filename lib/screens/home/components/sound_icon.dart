import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundIcon extends StatelessWidget {
  const SoundIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          width: 40,
          height: 40,
          child: SvgPicture.asset(
            "assets/svg/sound_icon.svg",
          ),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFFFCD4E),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, top: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
