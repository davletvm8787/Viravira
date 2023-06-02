// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assarickym/app/app_view_model.dart' as _i11;
import 'package:assarickym/app/utils/di.dart' as _i14;
import 'package:assarickym/app/utils/theme_pref.dart' as _i10;
import 'package:assarickym/data/network/app_api.dart' as _i6;
import 'package:assarickym/data/network/dio_factory.dart' as _i4;
import 'package:assarickym/data/repository/character_repository.dart' as _i7;
import 'package:assarickym/data/repository/episode_repository.dart' as _i8;
import 'package:assarickym/data/repository/location_repository.dart' as _i9;
import 'package:assarickym/presentation/characters/view_model/characters_view_model.dart'
    as _i12;
import 'package:assarickym/presentation/location/view_model/location_view_model.dart'
    as _i13;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.DioFactory>(() => _i4.DioFactory());
    await gh.lazySingletonAsync<_i5.Dio>(
      () => registerModule.getDio,
      preResolve: true,
    );
    gh.lazySingleton<_i6.AppServiceClient>(
        () => _i6.AppServiceClient(gh<_i5.Dio>()));
    gh.lazySingleton<_i7.CharacterRepository>(
        () => _i7.CharacterRepositoryImpl(gh<_i6.AppServiceClient>()));
    gh.lazySingleton<_i8.EpisodeRepository>(
        () => _i8.EpisodeRepositoryImpl(gh<_i6.AppServiceClient>()));
    gh.lazySingleton<_i9.LocationRepository>(
        () => _i9.LocationRepositoryImpl(gh<_i6.AppServiceClient>()));
    gh.singleton<_i10.ThemePref>(_i10.ThemePref());
    gh.singleton<_i11.AppViewModel>(_i11.AppViewModel(gh<_i10.ThemePref>()));
    gh.factory<_i12.CharactersViewModel>(
        () => _i12.CharactersViewModel(gh<_i7.CharacterRepository>()));
    gh.factory<_i13.LocationViewModel>(
        () => _i13.LocationViewModel(gh<_i9.LocationRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
