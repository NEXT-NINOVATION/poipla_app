import 'package:flutter/cupertino.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';
import 'package:poipla_app/models/repositories/costume_repository.dart';

class MyCostumeStore extends ChangeNotifier {
  MyCostumeStore({required this.costumeRepository});
  final CostumeRepository costumeRepository;

  List<Costume> myCostumes = [];
  Future<List<Costume>> fetchAll() async {
    myCostumes = await costumeRepository.getMyCostumes();
    notifyListeners();
    return myCostumes;
  }

  Future update(int costumeId) async {
    await costumeRepository.buyShopCostume(costumeId);
    notifyListeners();
  }
}
