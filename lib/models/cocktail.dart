class Cocktail {
  String? strDrink;
  String? strDrinkThumb;
  String? idDrink;
  String? strInstructions;

  Cocktail({
    this.strDrink,
    this.strDrinkThumb,
    this.idDrink,
    this.strInstructions,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      strDrink: json['drinks'][0]['strDrink'],
      strDrinkThumb: json['drinks'][0]['strDrinkThumb'],
      idDrink: json['drinks'][0]['idDrink'],
      strInstructions: json['drinks'][0]['strInstructions'],
    );
  }
}
