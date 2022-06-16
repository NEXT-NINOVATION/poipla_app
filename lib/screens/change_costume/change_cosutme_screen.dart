import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/models/database.dart';
import '../back_button.dart';

class ChangeCostumeScreen extends StatefulWidget {
  ChangeCostumeScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCostumeScreen> createState() => _ChangeCostumeScreenState();
}

class _ChangeCostumeScreenState extends State<ChangeCostumeScreen> {
  int fishCosIndex = 0;
  bool selected = true;

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    for (var row in myCostumeList) {}
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
          colors: kBackgroundColors,
          stops: [
            0.0,
            1.0,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: const PreviousButton(),
          leadingWidth: 80,
          title: const Text(
            "きせかえ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            SvgPicture.asset(
              "assets/svg/${myCostumeList[fishCosIndex].fish_image}",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: deviceW * 0.40,
                  child: const AppButton(text: "きまり！", isPos: true),
                ),
                SizedBox(
                  width: deviceW * 0.40,
                  child: const AppButton(text: "やめる", isPos: false),
                ),
              ],
            ),
            Container(
              height: deviceH * 0.45,
              width: deviceW,
              color: const Color(0xFFFFCD4E),
              child: GridView.count(
                padding: const EdgeInsets.all(25),
                childAspectRatio: 1.3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: List.generate(
                  myCostumeList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        fishCosIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  myCostumeList[index].costume_name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: SvgPicture.asset(
                                  "assets/svg/${myCostumeList[index].image}",
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                color: Colors.black38,
                              ),
                              SvgPicture.asset("assets/svg/check.svg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
