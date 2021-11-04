class CocktailInfo {
  String? strDrink;
  String? strDrinkThumb;
  String? idDrink;

  CocktailInfo({
    this.strDrink,
    this.strDrinkThumb,
    this.idDrink,
  });

  factory CocktailInfo.fromJson(Map<String, dynamic> json) {
    return CocktailInfo(
      strDrink: json['strDrink'],
      strDrinkThumb: json['strDrinkThumb'],
      idDrink: json['idDrink'],
    );
  }
}
