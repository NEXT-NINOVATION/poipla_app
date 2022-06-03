import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poipla_app/data/retrofit/service.dart';
import 'package:poipla_app/providers/token_providers.dart';

final poiplaApiServiceProvider = Provider((ref) {
  return create(ref.read(tokenProvider));
});
