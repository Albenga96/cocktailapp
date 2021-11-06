import 'package:cocktailapp/src/data/datasources/remote/remote_data_source.dart';
import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CocktailRepository)
class CocktailRepositoryImpl implements CocktailRepository {
  final RemoteDataSource _remoteDataSource;

  CocktailRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<CocktailEntity>> getAlcoholicCocktails(String alcoholic) async {
    return _remoteDataSource.getAlcoholicCocktails(alcoholic).then(
          (cocktailResponse) => cocktailResponse.drinks
              .map(
                (cocktail) => cocktail.toCocktailEntity,
              )
              .toList(),
        );
  }

  @override
  Future<List<CocktailEntity>> getCategoryCocktails(String category) async {
    return _remoteDataSource.getCategoryCocktails(category).then(
          (cocktailResponse) => cocktailResponse.drinks
              .map(
                (cocktail) => cocktail.toCocktailEntity,
              )
              .toList(),
        );
  }
}