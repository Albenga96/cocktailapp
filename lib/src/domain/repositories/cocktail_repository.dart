import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';

abstract class CocktailRepository {
  Future<List<CocktailEntity>> getAlcoholicCocktails(String alcoholic);
  Future<List<CocktailEntity>> getCategoryCocktails(String category);
  Future<CocktailDetailsEntity> getCocktailDetails(String drinkId);
  Future<CocktailDetailsEntity> getRandomCocktail();
  Future<List<CocktailEntity>> searchCocktailsByName(String name);
  Future<List<CocktailEntity>> searchCocktailsByIngredient(String ingredient);
  Future<void> insertFavorite(CocktailEntity cocktailEntity);
  Future<List<CocktailEntity>> retrieveFavorites();
  Future<void> deleteFavorite(String drinkId);
  Future<CocktailEntity?> findFavoriteById(String drinkId);
}
