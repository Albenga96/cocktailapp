// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i4;

import '../data/datasources/local/local_data_source.dart' as _i5;
import '../data/datasources/local/local_data_source_impl.dart' as _i6;
import '../data/datasources/remote/remote_data_source.dart' as _i7;
import '../data/repositories/cocktail_repository_impl.dart' as _i9;
import '../domain/repositories/cocktail_repository.dart' as _i8;
import '../domain/usecase/delete_favorite_use_case.dart' as _i10;
import '../domain/usecase/find_favorite_by_id_use_case.dart' as _i11;
import '../domain/usecase/get_alcoholic_cocktails_use_case.dart' as _i12;
import '../domain/usecase/get_category_cocktails_use_case.dart' as _i13;
import '../domain/usecase/get_cocktail_details_use_case.dart' as _i14;
import '../domain/usecase/get_random_cocktail_use_case.dart' as _i15;
import '../domain/usecase/insert_favorite_use_case.dart' as _i16;
import '../domain/usecase/retrieve_favorites_use_case.dart' as _i17;
import '../domain/usecase/search_cocktails_by_ingredient_use_case.dart' as _i18;
import '../domain/usecase/search_cocktails_by_name_use_case.dart' as _i19;
import 'app_module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.Dio>(() => appModule.provideDio());
  gh.lazySingleton<_i4.LocalAuthentication>(() => appModule.localAuth);
  gh.lazySingleton<_i5.LocalDataSource>(() => _i6.LocalDataSourceImpl());
  gh.factory<_i7.RemoteDataSource>(() => _i7.RemoteDataSource(get<_i3.Dio>()));
  gh.lazySingleton<_i8.CocktailRepository>(() => _i9.CocktailRepositoryImpl(
      get<_i7.RemoteDataSource>(), get<_i5.LocalDataSource>()));
  gh.factory<_i10.DeleteFavoriteUseCase>(
      () => _i10.DeleteFavoriteUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i11.FindFavoriteUseCase>(
      () => _i11.FindFavoriteUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i12.GetAlcoholicCocktailsUseCase>(
      () => _i12.GetAlcoholicCocktailsUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i13.GetCategoryCocktailsUseCase>(
      () => _i13.GetCategoryCocktailsUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i14.GetCocktailDetailsUseCase>(
      () => _i14.GetCocktailDetailsUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i15.GetRandomCocktailUseCase>(
      () => _i15.GetRandomCocktailUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i16.InsertFavoriteUseCase>(
      () => _i16.InsertFavoriteUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i17.RetrieveFavoriteUseCase>(
      () => _i17.RetrieveFavoriteUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i18.SearchCocktailsByIngredientUseCase>(() =>
      _i18.SearchCocktailsByIngredientUseCase(get<_i8.CocktailRepository>()));
  gh.factory<_i19.SearchCocktailsByNameUseCase>(
      () => _i19.SearchCocktailsByNameUseCase(get<_i8.CocktailRepository>()));
  return get;
}

class _$AppModule extends _i20.AppModule {}
