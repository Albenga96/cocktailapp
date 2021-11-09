class CocktailDetailsEntity {
  String drinkName;
  String drinkThumbnail;
  String drinkId;
  String drinkCategory;
  String drinkAlcoholic;
  String drinkGlass;
  String drinkInstructionsIT;
  List<String?> ingredients;

  List<String?> measures;

  CocktailDetailsEntity({
    required this.drinkName,
    required this.drinkThumbnail,
    required this.drinkId,
    required this.drinkCategory,
    required this.drinkAlcoholic,
    required this.drinkGlass,
    required this.drinkInstructionsIT,
    required this.ingredients,
    required this.measures,
  });
}
