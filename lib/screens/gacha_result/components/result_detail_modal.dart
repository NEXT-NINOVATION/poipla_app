import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';
import 'package:poipla_app/screens/app_button.dart';

class ResultDetailModal extends StatefulWidget {
  const ResultDetailModal({Key? key, required this.results}) : super(key: key);
  final List<ClatterResult> results;

  @override
  State<ResultDetailModal> createState() => _ResultDetailModal();
}

class _ResultDetailModal extends State<ResultDetailModal> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

    final point = () {
      int sum = 0;
      for (var element in widget.results) {
        sum += element.earnExp ?? 0;
      }
      return sum;
    }();

    final costumes =
        widget.results.map((e) => e.costume).whereType<Costume>().toList();

    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFA63E),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  const Text(
                    "もらったもの",
                    style: TextStyle(
                      color: kAppBarFontColor,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "きれいにしてくれてありがとう！",
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: deviceW * 0.6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: deviceW * 0.45,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFE6A6),
                          ),
                        ),
                        Container(
                          width: (deviceW * 0.5) / 1.3,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFA63E),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "レベル",
                              style: TextStyle(
                                color: Color(0xFFC29217),
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 17),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFCD4E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFFC29217),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "レベル",
                              style: TextStyle(
                                color: Color(0xFFC29217),
                                fontSize: 12,
                                letterSpacing: 2,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 17),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFFFCD4E),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xFFC29217),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: deviceH * 0.26,
                child: GridView.count(
                  padding: const EdgeInsets.all(20),
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 0,
                  crossAxisCount: 3,
                  // physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    costumes.length,
                    (index) => SvgPicture.asset(
                      "assets/svg/${costumes[index].image}.svg",
                      width: 100,
                      // clipBehavior: Clip.hardEdge,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "きせかえ×" + "${costumes.length}",
                    style: const TextStyle(
                        color: Color(0xFFFFA63E),
                        fontSize: 24,
                        letterSpacing: 3),
                  ),
                  const Text(
                    "ゲット！",
                    style: TextStyle(
                        color: kFontColor, fontSize: 16, letterSpacing: 3),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "$point",
                    style: const TextStyle(
                        color: Color(0xFFFFA63E),
                        fontSize: 24,
                        letterSpacing: 3),
                  ),
                  const Text(
                    "ポイントゲット！",
                    style: TextStyle(
                        color: kFontColor, fontSize: 16, letterSpacing: 3),
                  ),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/');
              },
              child: SizedBox(
                width: deviceW * 0.45,
                child: const AppButton(text: "とじる", isPos: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
