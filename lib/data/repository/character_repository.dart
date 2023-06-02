import 'package:assarickym/data/models/character_model.dart';
import 'package:injectable/injectable.dart';

import '../../app/base/base_model.dart';
import '../../app/utils/constant.dart';
import '../network/app_api.dart';
import '../network/error_handler.dart';

abstract class CharacterRepository {
  Future<DataModel<List<Character>>> getCharacters();
}

@LazySingleton(as: CharacterRepository, order: DiOrder.repository)
class CharacterRepositoryImpl implements CharacterRepository {
  final AppServiceClient _appServiceClient;
  CharacterRepositoryImpl(this._appServiceClient);

  @override
  Future<DataModel<List<Character>>> getCharacters() async {
    try {
      final result = await _appServiceClient.getAllCharacters();
      return DataModel.ok(data: result);
    } catch (e) {
      return DataModel.error(ErrorHandler.handle(e).failure);
    }
  }
}
