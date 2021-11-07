// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailDetailsResponse _$CocktailDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    CocktailDetailsResponse(
      (json['drinks'] as List<dynamic>)
          .map((e) => CocktailDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailDetailsResponseToJson(
        CocktailDetailsResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
