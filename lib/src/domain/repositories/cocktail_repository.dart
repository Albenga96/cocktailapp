import '../../data/models/cocktail.dart';

abstract class CocktailRepository {
  Future<List<Cocktail>> getAlcoholicCocktails(String alcoholic);
  Future<List<Cocktail>> getCategoryCocktails(String category);
}
