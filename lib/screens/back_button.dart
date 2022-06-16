import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreviousButton extends StatelessWidget {
  const PreviousButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 48,
          width: 64,
          decoration: BoxDecoration(
            color: const Color(0xFF94EDFF),
            border: Border.all(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/arrow.svg",
                width: 20,
              ),
              const Text(
                "もどる",
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF207CAF),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 5, right: 5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEAFEFF),
          ),
        ),
      ],
    );
  }
}
