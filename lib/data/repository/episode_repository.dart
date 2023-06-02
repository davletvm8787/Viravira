import 'package:assarickym/data/models/episode_model.dart';
import 'package:injectable/injectable.dart';

import '../../app/base/base_model.dart';
import '../../app/utils/constant.dart';
import '../network/app_api.dart';
import '../network/error_handler.dart';

abstract class EpisodeRepository {
  Future<DataModel<List<Episode>>> getEpisodes();
}

@LazySingleton(as: EpisodeRepository, order: DiOrder.repository)
class EpisodeRepositoryImpl implements EpisodeRepository {
  final AppServiceClient _appServiceClient;
  EpisodeRepositoryImpl(this._appServiceClient);

  @override
  Future<DataModel<List<Episode>>> getEpisodes() async {
    try {
      final result = await _appServiceClient.getAllEpisodes();
      return DataModel.ok(data: result);
    } catch (e) {
      return DataModel.error(ErrorHandler.handle(e).failure);
    }
  }
}
