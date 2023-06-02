import 'package:assarickym/app/utils/constant.dart';
import 'package:assarickym/app/utils/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/dio_factory.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  @LazySingleton(order: DiOrder.sharedPreferences)
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  @LazySingleton(order: DiOrder.dio)
  Future<Dio> get getDio => getIt<DioFactory>().getDio();
}

Future<void> resetInstance() async {
  await getIt.reset(dispose: false);
  await configureDependencies();
}
