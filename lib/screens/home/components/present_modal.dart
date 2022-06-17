import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/database.dart';
import 'package:poipla_app/screens/app_button.dart';

class PresentModal extends StatefulWidget {
  PresentModal({Key? key}) : super(key: key);

  @override
  State<PresentModal> createState() => _PresentModalState();
}

class _PresentModalState extends State<PresentModal> {
  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.only(
        bottom: 5,
        top: 80,
        left: 15,
        right: 15,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)), //this right here
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                "プレゼント",
                style: TextStyle(
                  color: kAppBarFontColor,
                  fontSize: 18,
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFCD4E),
              ),
              child: GridView.count(
                padding: const EdgeInsets.all(25),
                childAspectRatio: 2.5,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 1,
                children: List.generate(
                  myPresentList.length,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFFFE6A6),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              "assets/svg/shachihoko.png",
                              width: 70,
                              height: 65,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                myPresentList[index].title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: kFontColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                myPresentList[index].detail,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kFontColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const ReceiveButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: deviceH * 0.16,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const AppButton(text: "とじる", isPos: false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 受け取るボタン
class ReceiveButton extends StatelessWidget {
  const ReceiveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 受け取り処理
      },
      child: SizedBox(
        width: 147,
        height: 25,
        child: Stack(
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
                    offset: Offset(0, 4),
                  ),
                  // ボタン上部
                  BoxShadow(
                    color: Color(0xFFFFF4D9),
                  ),
                  // ボタン中部
                  BoxShadow(
                    color: Color(0xFFFFCD4E),
                    blurRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              // 泡のデザイン
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10.0, top: 1.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFFFF4D9)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5.0, top: 1.0),
                    width: 4.0,
                    height: 4.0,
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
                "うけとる",
                style: const TextStyle(
                  fontSize: 16,
                  color: kFontColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
