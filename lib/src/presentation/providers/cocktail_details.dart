import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:cocktailapp/src/domain/usecase/get_cocktail_details_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/get_random_cocktail_use_case.dart';
import 'package:flutter/material.dart';

class CocktailDetails with ChangeNotifier {
  final GetCocktailDetailsUseCase _getCocktailDetailsUseCase;
  final GetRandomCocktailUseCase _getRandomCocktailUseCase;

  CocktailDetails(
      this._getCocktailDetailsUseCase, this._getRandomCocktailUseCase);

  CocktailDetailsEntity _cocktailDetails = CocktailDetailsEntity(
    drinkName: "",
    drinkThumbnail: "",
    drinkId: "",
    drinkCategory: "",
    drinkAlcoholic: "",
    drinkGlass: "",
    drinkInstructionsIT: "",
    ingredients: [],
    measures: [],
  );

  CocktailDetailsEntity get cocktailDetails {
    return _cocktailDetails;
  }

  String drinkId = "";

  Future<void> fetchCocktailDetails() async {
    try {
      _cocktailDetails = await _getCocktailDetailsUseCase(
        params: drinkId,
      );
      notifyListeners();
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }

  Future<void> fetchRandomCocktail() async {
    try {
      _cocktailDetails = await _getRandomCocktailUseCase(
        params: "",
      );
      notifyListeners();
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }
}
