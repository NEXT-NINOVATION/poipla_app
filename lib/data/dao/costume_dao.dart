import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';
import 'package:poipla_app/models/repositories/costume_repository.dart';

class CostumeDao implements CostumeRepository {
  final PoiplaApiService apiService;
  CostumeDao({required this.apiService});

  @override
  Future<List<Costume>> getMyCostumes() {
    return apiService.getMyCostumes();
  }
}
