import 'package:assarickym/app/base/base_model.dart';
import 'package:assarickym/data/models/location_model.dart';
import 'package:injectable/injectable.dart';

import '../../app/utils/constant.dart';
import '../network/app_api.dart';
import '../network/error_handler.dart';

abstract class LocationRepository {
  Future<DataModel<List<Location>>> getLocations();
}

@LazySingleton(as: LocationRepository, order: DiOrder.repository)
class LocationRepositoryImpl implements LocationRepository {
  final AppServiceClient _appServiceClient;
  LocationRepositoryImpl(this._appServiceClient);

  @override
  Future<DataModel<List<Location>>> getLocations() async {
    try {
      final result = await _appServiceClient.getAllLocation();
      return DataModel.ok(data: result);
    } catch (e) {
      return DataModel.error(ErrorHandler.handle(e).failure);
    }
  }
}
