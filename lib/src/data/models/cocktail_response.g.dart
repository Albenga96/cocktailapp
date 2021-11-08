// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CocktailResponse _$CocktailResponseFromJson(Map<String, dynamic> json) =>
    CocktailResponse(
      (json['drinks'] as List<dynamic>?)
          ?.map((e) => Cocktail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CocktailResponseToJson(CocktailResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
