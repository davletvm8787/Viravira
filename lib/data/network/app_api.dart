import 'package:assarickym/app/utils/constant.dart';
import 'package:assarickym/data/models/character_model.dart';
import 'package:assarickym/data/models/episode_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../models/location_model.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseURL)
@LazySingleton(order: DiOrder.appServiceClient)
abstract class AppServiceClient {
  @FactoryMethod()
  factory AppServiceClient(Dio dio) = _AppServiceClient;

//Locations
  @GET('/location')
  Future<List<Location>> getAllLocation();

//Character
  @GET('/character')
  Future<List<Character>> getAllCharacters();

//Episodes
  @GET('/episode')
  Future<List<Episode>> getAllEpisodes();
}
