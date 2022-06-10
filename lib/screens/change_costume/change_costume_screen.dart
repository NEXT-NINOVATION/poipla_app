import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/database.dart';

class ChangeCostumeScreen extends StatefulWidget {
  ChangeCostumeScreen({Key? key}) : super(key: key);

  @override
  State<ChangeCostumeScreen> createState() => _ChangeCostumeScreenState();
}

class _ChangeCostumeScreenState extends State<ChangeCostumeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var point = 120;

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
          title: const Text(
            "きせかえ",
            style: TextStyle(
              color: kFontColor,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
              alignment: Alignment.centerRight,
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "ちょきん",
                      style: TextStyle(
                        color: kFontColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "$point",
                      style: const TextStyle(
                        color: kFontColorOrange,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "ポイント",
                        style: TextStyle(
                          color: kFontColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              width: 320,
              height: 160,
              child: const Text("バナー"),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(25),
                childAspectRatio: 1.1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: List.generate(
                  costume_list.length,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: costume_list[index].buyable_flag == true
                            ? Colors.white
                            : Colors.grey,
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: Text(
                                  costume_list[index].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: SvgPicture.asset(
                                  "assets/svg/${costume_list[index].image}",
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${costume_list[index].point}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const Text("ポイント"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          costume_list[index].buyable_flag == false
                              ? Container(
                                  alignment: Alignment.center,
                                  child:
                                      SvgPicture.asset("assets/svg/lock.svg"),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
