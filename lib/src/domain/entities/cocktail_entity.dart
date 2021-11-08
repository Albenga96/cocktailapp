class CocktailEntity {
  String drinkName;
  String drinkThumbnail;
  String drinkId;

  CocktailEntity({
    required this.drinkName,
    required this.drinkThumbnail,
    required this.drinkId,
  });

  Map<String, dynamic> toMap() {
    return {
      "drinkName": drinkName,
      "drinkId": drinkId,
      "drinkThumbnail": drinkThumbnail,
    };
  }

  @override
  String toString() {
    return "Cocktail Entity: $drinkName";
  }
}
