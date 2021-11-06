import 'package:cocktailapp/src/data/datasources/remote/remote_data_source.dart';
import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:cocktailapp/src/domain/repositories/cocktail_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CocktailRepository)
class CocktailRepositoryImpl implements CocktailRepository {
  final RemoteDataSource _remoteDataSource;

  CocktailRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Cocktail>> getAlcoholicCocktails(String alcoholic) =>
      _remoteDataSource.getAlcoholicCocktails(alcoholic);

  @override
  Future<List<Cocktail>> getCategoryCocktails(String category) =>
      _remoteDataSource.getCategoryCocktails(category);
}
