import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail.g.dart';

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

extension CocktailToCocktailEntity on Cocktail {
  CocktailEntity get toCocktailEntity {
    return CocktailEntity(
      drinkName: strDrink,
      drinkThumbnail: strDrinkThumb,
      drinkId: idDrink,
    );
  }
}
