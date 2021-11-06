import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail_response.g.dart';

@JsonSerializable()
class CocktailResponse {
  final List<Cocktail> drinks;

  CocktailResponse(this.drinks);

  factory CocktailResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailResponseToJson(this);
}
