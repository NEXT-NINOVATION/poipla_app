import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/models/database.dart';
import 'package:poipla_app/providers/api_providers.dart';
import 'package:poipla_app/screens/custom_back_button.dart';
import 'package:poipla_app/screens/home/components/setting_button.dart';
import 'package:poipla_app/screens/home/components/setting_modal.dart';
import 'package:poipla_app/screens/shop/components/buy_modal.dart';

final shopCostumesFutureProvider = FutureProvider((ref) {
  return ref
      .read(poiplaApiServiceProvider)
      .getShopCostumes()
      .catchError((e, st) {
    log('fetch shop error', error: e, stackTrace: st);
  });
});

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreen();
}

class _ShopScreen extends ConsumerState<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final costumeListState = ref.watch(shopCostumesFutureProvider);

    final costumeList = costumeListState.whenOrNull(
          data: (d) => d,
        ) ??
        [];
    var point = 1200;
    log('costumes: $costumeList');

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
            "ショップ",
            style: TextStyle(
              color: kAppBarFontColor,
            ),
          ),
          backgroundColor: kAppBarColor,
          elevation: 0.0,
          leading: const CustomBackButton(),
          leadingWidth: 80,
          actions: [
            GestureDetector(
              onTap: () {
                showDialog(
                  // Dialogの周囲の黒い部分をタップしても閉じないようにする
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => SettingModal(),
                );
              },
              child: const SettingButton(),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, right: 15, bottom: 15),
              alignment: Alignment.centerRight,
              child: Container(
                width: 240,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
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
                        color: kFontColorImportant,
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
              width: 320,
              height: 160,
              child: Image.asset(
                "assets/svg/costume_banner.png",
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(25),
                childAspectRatio: 1.1,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                children: List.generate(
                  costumeList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      showDialog(
                        // Dialogの周囲の黒い部分をタップしても閉じないようにする
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => BuyModal(
                            nowPoint: point,
                            costumeName: costumeList[index].costumeName,
                            imageName: '${costumeList[index].image}.svg',
                            point: costumeList[index].point),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: costumeList[index].isBuyable
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
                                  costumeList[index].costumeName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/svg/${costumeList[index].image}.svg",
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 5, bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${costumeList[index].point}",
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
                          costumeList[index].isBuyable == false
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
