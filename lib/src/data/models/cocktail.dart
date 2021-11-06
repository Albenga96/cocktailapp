import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Cocktail {
  String strDrink;
  String strDrinkThumb;
  String idDrink;

  Cocktail({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.idDrink,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) =>
      _$CocktailFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailToJson(this);
}
