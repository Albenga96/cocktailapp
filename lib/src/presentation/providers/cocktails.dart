import 'package:flutter/material.dart';

import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/usecase/get_alcoholic_cocktails_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/get_category_cocktails_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/search_cocktails_by_ingredient_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/search_cocktails_by_name_use_case.dart';

class Cocktails with ChangeNotifier {
  Cocktails(
    this._alcoholicCocktailsUseCase,
    this._categoryCocktailsUseCase,
    this._searchCocktailsByNameUseCase,
    this._searchCocktailsByIngredientUseCase,
  );

  final GetAlcoholicCocktailsUseCase _alcoholicCocktailsUseCase;
  final GetCategoryCocktailsUseCase _categoryCocktailsUseCase;
  final SearchCocktailsByNameUseCase _searchCocktailsByNameUseCase;
  final SearchCocktailsByIngredientUseCase _searchCocktailsByIngredientUseCase;

  List<CocktailEntity> get cocktails {
    return [..._cocktails];
  }

  List<CocktailEntity> _cocktails = [];

  String filter = '';

  String name = '';

  String ingredient = '';

  Future<void> fetchAlcoholicCocktails() async {
    try {
      _cocktails = await _alcoholicCocktailsUseCase(
        params: filter,
      );
      notifyListeners();
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }

  Future<void> fetchCategoryCocktails() async {
    try {
      _cocktails = await _categoryCocktailsUseCase(
        params: filter,
      );
      notifyListeners();
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }

  Future<void> searchCocktailsByName() async {
    try {
      _cocktails = await _searchCocktailsByNameUseCase(
        params: name,
      );
      notifyListeners();
    } catch (e) {
      print(e);
      throw ("Si è verificato un errore");
    }
  }

  Future<void> searchCocktailsByIngredient() async {
    try {
      _cocktails = await _searchCocktailsByIngredientUseCase(
        params: ingredient,
      );
      notifyListeners();
    } catch (e) {
      print(e);
      throw ("Si è verificato un errore");
    }
  }

  void clear() {
    _cocktails = [];
    notifyListeners();
  }
}
