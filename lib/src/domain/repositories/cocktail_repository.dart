import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';

abstract class CocktailRepository {
  Future<List<CocktailEntity>> getAlcoholicCocktails(String alcoholic);
  Future<List<CocktailEntity>> getCategoryCocktails(String category);
  Future<CocktailDetailsEntity> getCocktailDetails(String drinkId);
  Future<CocktailDetailsEntity> getRandomCocktail();
}
