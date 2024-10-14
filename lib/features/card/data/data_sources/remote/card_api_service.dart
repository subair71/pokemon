import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sample/core/constatns/constatns.dart';

part 'card_api_service.g.dart';

@RestApi(baseUrl: pokeMonBaseUrl)
abstract class CardApiService {
  factory CardApiService(Dio dio) = _CardApiService;
  @GET('')
  Future<HttpResponse<String>> fetchCards(@Query("page") String page,@Query("pageSize") String pageSize);

  @GET('')
  Future<HttpResponse<String>> searchCards(@Query("q") String query,@Query("page") String page,@Query("pageSize") String pageSize);
}
