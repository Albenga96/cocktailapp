import 'dart:async';

import 'package:cocktailapp/models/cocktail.dart';
import 'package:cocktailapp/models/cocktail_info.dart';

import 'coktails_api_provider.dart';

class Repository {
  final drinkApiProvider = CoktailApiProvider();

  Future<List<CocktailInfo>> getDrinkOptions(String search) {
    return drinkApiProvider.getDrinkOptions(search);
  }

  Future<Cocktail> getDrinkDetails(String id) {
    return drinkApiProvider.getDrinkDetails(id);
  }

  Future<Cocktail> getDrinkRandom() {
    return drinkApiProvider.getDrinkRandom();
  }
}
