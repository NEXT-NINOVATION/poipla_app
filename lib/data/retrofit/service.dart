import 'package:dio/dio.dart';
import 'package:poipla_app/models/entities/clatter_result/clatter_result.dart';
import 'package:poipla_app/models/entities/costume/costume.dart';
import 'package:poipla_app/models/entities/session/session.dart';
import 'package:poipla_app/models/entities/token/token.dart';
import 'package:poipla_app/models/entities/user/user.dart';
import 'package:poipla_app/models/services/token_service.dart';
import 'package:poipla_app/models/shop_costume/shop_costume.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi(baseUrl: 'https://poipla.yumekiti.net/api')
abstract class PoiplaApiService {
  factory PoiplaApiService(Dio dio, {String baseUrl}) = _PoiplaApiService;

  @GET('/me')
  Future<User> getMe();

  @POST('/register')
  Future<Token> register();

  @POST('/shops/{costumeId}')
  Future buyShopCostume(@Path('costumeId') String costumeId);

  @POST('/dust-boxes/{boxId}/sessions')
  Future<Session> createSession(@Path('boxId') String boxId);

  @POST('/me/points')
  Future<User> postGameResult(@Body() Map<String, dynamic> body);

  @PUT('/dust-boxes/{boxId}/sessions/{sessionId}')
  Future<List<ClatterResult>> completeSession(
      @Path('boxId') String boxId, @Path('sessionId') String sessionId);

  @PUT('/me')
  Future<User> updateUser(@Body() Map<String, dynamic> body);

  @GET('/me/costumes')
  Future<List<Costume>> getMyCostumes();

  @GET('/dust-boxes/{boxId}/sessions/{sessionId}/clatter-results')
  Future<List<ClatterResult>> getClatterResults(
    @Path('boxId') String boxId,
    @Path('sessionId') String sessionId,
  );

  @GET('/shops')
  Future<List<ShopCostume>> getShopCostumes();
}

PoiplaApiService create(TokenService service,
    {String baseUrl = 'https://poipla.yumekiti.net/api'}) {
  final dio = Dio();

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    final token = await service.get();
    if (token != null) {
      options.headers['Authorization'] = "Bearer $token";
    }
    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }));
  return PoiplaApiService(dio, baseUrl: baseUrl);
}
