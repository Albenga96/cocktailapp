import 'package:json_annotation/json_annotation.dart';

import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';

part 'cocktail_details.g.dart';

@JsonSerializable()
class CocktailDetails {
  String idDrink;
  String strDrink;
  String strDrinkThumb;
  String? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
//  String strInstructionsZHHANS;
//  String strInstructionsZHHANT;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;

  CocktailDetails({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
//    required this.strInstructionsZHHANS,
//    required this.strInstructionsZHHANT,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory CocktailDetails.fromJson(Map<String, dynamic> json) =>
      _$CocktailDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CocktailDetailsToJson(this);
}

extension CocktailDetailsToCocktailDetailsEntity on CocktailDetails {
  CocktailDetailsEntity get toCocktailDetailsEntity {
    return CocktailDetailsEntity(
      drinkAlcoholic: strAlcoholic!,
      drinkCategory: strCategory!,
      drinkGlass: strGlass!,
      drinkId: idDrink,
      drinkInstructionsIT: strInstructionsIT!,
      drinkName: strDrink,
      drinkThumbnail: strDrinkThumb,
      ingredients: [
        if (strIngredient1 != null) strIngredient1,
        if (strIngredient2 != null) strIngredient2,
        if (strIngredient3 != null) strIngredient3,
        if (strIngredient4 != null) strIngredient4,
        if (strIngredient5 != null) strIngredient5,
        if (strIngredient6 != null) strIngredient6,
        if (strIngredient7 != null) strIngredient7,
        if (strIngredient8 != null) strIngredient8,
        if (strIngredient9 != null) strIngredient9,
        if (strIngredient10 != null) strIngredient10,
        if (strIngredient11 != null) strIngredient11,
        if (strIngredient12 != null) strIngredient12,
        if (strIngredient13 != null) strIngredient13,
        if (strIngredient14 != null) strIngredient14,
        if (strIngredient15 != null) strIngredient15,
      ],
      measures: [
        if (strMeasure1 != null) strMeasure1,
        if (strMeasure2 != null) strMeasure2,
        if (strMeasure3 != null) strMeasure3,
        if (strMeasure4 != null) strMeasure4,
        if (strMeasure5 != null) strMeasure5,
        if (strMeasure6 != null) strMeasure6,
        if (strMeasure7 != null) strMeasure7,
        if (strMeasure8 != null) strMeasure8,
        if (strMeasure9 != null) strMeasure9,
        if (strMeasure10 != null) strMeasure10,
        if (strMeasure11 != null) strMeasure11,
        if (strMeasure12 != null) strMeasure12,
        if (strMeasure13 != null) strMeasure13,
        if (strMeasure14 != null) strMeasure14,
        if (strMeasure15 != null) strMeasure15,
      ],
    );
  }
}
