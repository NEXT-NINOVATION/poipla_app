import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/dao/costume_dao.dart';
import 'package:poipla_app/models/repositories/costume_repository.dart';
import 'package:poipla_app/providers/api_providers.dart';
import 'package:poipla_app/store/my_costume_store.dart';

final costumeRepositoryProvider = Provider<CostumeRepository>((ref) {
  return CostumeDao(apiService: ref.read(poiplaApiServiceProvider));
});

final myCostumeStoreProvider = ChangeNotifierProvider.autoDispose((ref) {
  return MyCostumeStore(costumeRepository: ref.read(costumeRepositoryProvider));
});
