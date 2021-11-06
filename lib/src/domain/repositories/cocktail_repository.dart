import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';

abstract class CocktailRepository {
  Future<List<CocktailEntity>> getAlcoholicCocktails(String alcoholic);
  Future<List<CocktailEntity>> getCategoryCocktails(String category);
}
