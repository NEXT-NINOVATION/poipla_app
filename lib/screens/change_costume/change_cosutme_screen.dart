import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:poipla_app/constants.dart';
import 'package:poipla_app/providers/costume_provider.dart';
import 'package:poipla_app/providers/user_provider.dart';
import 'package:poipla_app/screens/app_button.dart';
import 'package:poipla_app/screens/custom_back_button.dart';
import 'package:poipla_app/screens/home/components/setting_button.dart';
import 'package:poipla_app/screens/home/components/setting_modal.dart';

class ChangeCostumeScreen extends ConsumerStatefulWidget {
  const ChangeCostumeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChangeCostumeScreen> createState() =>
      _ChangeCostumeScreenState();
}

final myCostumeFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(costumeRepositoryProvider).getMyCostumes();
});

class _ChangeCostumeScreenState extends ConsumerState<ChangeCostumeScreen> {
  // int fishCosIndex = 0;
  int? selectedCosId;
  bool selected = true;

  @override
  void initState() {
    selectedCosId = ref.read(accountStoreProvider).currentUser?.costumeId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncMyCostumes = ref.watch(myCostumeFutureProvider);
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;

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
            leading: const CustomBackButton(),
            leadingWidth: 80,
            title: const Text(
              "きせかえ",
              style: TextStyle(
                color: kAppBarFontColor,
              ),
            ),
            backgroundColor: kAppBarColor,
            elevation: 0.0,
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
          body: asyncMyCostumes.when(data: (data) {
            final selectedCos = () {
              final filtered =
                  data.where((element) => element.id == selectedCosId);
              if (filtered.isEmpty) {
                return null;
              } else {
                return filtered.first;
              }
            }();

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 20),
                if (selectedCos != null)
                  SvgPicture.asset(
                    "assets/svg/fish_${selectedCos.image}.svg",
                  )
                else
                  SvgPicture.asset("assets/svg/fish_default.svg"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(accountStoreProvider)
                            .changeCurrentCostume(costumeId: selectedCosId);
                        ref.read(myCostumeStoreProvider).fetchAll();
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: deviceW * 0.40,
                        child: const AppButton(text: "きまり！", isPos: true),
                      ),
                    ),
                    SizedBox(width: deviceW * 0.05),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        width: deviceW * 0.40,
                        child: const AppButton(text: "やめる", isPos: false),
                      ),
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
                      data.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCosId = data[index].id;
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
                                    padding:
                                        const EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      data[index].costumeName,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    child: SvgPicture.asset(
                                      "assets/svg/${data[index].image}.svg",
                                    ),
                                  ),
                                ],
                              ),
                              data[index].id == selectedCosId
                                  ? Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.black38,
                                          ),
                                        ),
                                        Positioned(
                                          top: -8,
                                          left: -8,
                                          child: SvgPicture.asset(
                                            "assets/svg/check.svg",
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }, error: (e, st) {
            return const Center(
              child: Text("コスチュームの取得に失敗"),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
