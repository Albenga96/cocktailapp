import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:cocktailapp/src/data/models/cocktail_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cocktail_details_response.g.dart';

@JsonSerializable()
class CocktailDetailsResponse {
  final List<CocktailDetails> drinks;

  CocktailDetailsResponse(this.drinks);

  factory CocktailDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailDetailsResponseToJson(this);
}
