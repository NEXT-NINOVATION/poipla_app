import 'package:dio/dio.dart';
import 'package:poipla_app/models/entities/user/user.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';

@RestApi(baseUrl: "https://poipla.yumekiti.net/api")
abstract class PoiplaApiService {
  factory PoiplaApiService(Dio dio, {String baseUrl}) = _PoiplaApiService;

  @GET('/me')
  Future<User> getMe();

}