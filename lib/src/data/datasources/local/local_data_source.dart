import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';

abstract class LocalDataSource {
  Future<void> insertFavorite(CocktailEntity cocktailEntity);
  Future<List<CocktailEntity>> retrieveFavorites();
  Future<void> deleteFavorite(String drinkId);
  Future<CocktailEntity?> findFavoriteById(String drinkId);
}
