import 'package:cocktailapp/src/domain/entities/cocktail_details_entity.dart';
import 'package:cocktailapp/src/domain/usecase/get_cocktail_details_use_case.dart';
import 'package:flutter/material.dart';

class CocktailDetails with ChangeNotifier {
  final GetCocktailDetailsUseCase _getCocktailDetailsUseCase;

  CocktailDetails(this._getCocktailDetailsUseCase);

  CocktailDetailsEntity _cocktailDetails = CocktailDetailsEntity(
    drinkName: "",
    drinkThumbnail: "",
    drinkId: "",
    drinkCategory: "",
    drinkAlcoholic: "",
    drinkGlass: "",
    drinkInstructionsIT: "",
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
      print("************" + e.toString());
      throw ("Si è verificato un errore");
    }
  }
}
