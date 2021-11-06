import 'package:cocktailapp/src/data/models/cocktail.dart';
import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/usecase/get_alcoholic_cocktails_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/get_category_cocktails_use_case.dart';
import 'package:flutter/material.dart';

class Cocktails with ChangeNotifier {
  Cocktails(
    this._alcoholicCocktailsUseCase,
    this._categoryCocktailsUseCase,
  );

  final GetAlcoholicCocktailsUseCase _alcoholicCocktailsUseCase;
  final GetCategoryCocktailsUseCase _categoryCocktailsUseCase;

  List<CocktailEntity> get cocktails {
    return [..._cocktails];
  }

  List<CocktailEntity> _cocktails = [];

  String filter = '';

  Future<void> fetchAlcoholicCocktails() async {
    try {
      _cocktails = await _alcoholicCocktailsUseCase(
        params: filter,
      );
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }

  Future<void> fetchCategoryCocktails() async {
    try {
      _cocktails = await _categoryCocktailsUseCase(
        params: filter,
      );
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }
}
