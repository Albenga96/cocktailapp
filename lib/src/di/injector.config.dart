// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i4;

import '../data/datasources/remote/remote_data_source.dart' as _i5;
import '../data/repositories/cocktail_repository_impl.dart' as _i7;
import '../domain/repositories/cocktail_repository.dart' as _i6;
import '../domain/usecase/get_alcoholic_cocktails_use_case.dart' as _i8;
import '../domain/usecase/get_category_cocktails_use_case.dart' as _i9;
import '../domain/usecase/get_cocktail_details_use_case.dart' as _i10;
import 'app_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.provideDio());
  gh.lazySingleton<_i4.LocalAuthentication>(() => appModule.localAuth);
  gh.factory<_i5.RemoteDataSource>(() => _i5.RemoteDataSource(get<_i3.Dio>()));
  gh.lazySingleton<_i6.CocktailRepository>(
      () => _i7.CocktailRepositoryImpl(get<_i5.RemoteDataSource>()));
  gh.factory<_i8.GetAlcoholicCocktailsUseCase>(
      () => _i8.GetAlcoholicCocktailsUseCase(get<_i6.CocktailRepository>()));
  gh.factory<_i9.GetCategoryCocktailsUseCase>(
      () => _i9.GetCategoryCocktailsUseCase(get<_i6.CocktailRepository>()));
  gh.factory<_i10.GetCocktailDetailsUseCase>(
      () => _i10.GetCocktailDetailsUseCase(get<_i6.CocktailRepository>()));
  return get;
}

class _$AppModule extends _i11.AppModule {}
