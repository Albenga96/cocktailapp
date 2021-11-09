import 'package:cocktailapp/src/domain/entities/cocktail_entity.dart';
import 'package:cocktailapp/src/domain/usecase/delete_favorite_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/find_favorite_by_id_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/insert_favorite_use_case.dart';
import 'package:cocktailapp/src/domain/usecase/retrieve_favorites_use_case.dart';
import 'package:flutter/material.dart';

class FavoriteCocktails with ChangeNotifier {
  final InsertFavoriteUseCase _insertFavoriteUseCase;
  final RetrieveFavoriteUseCase _retrieveFavoriteUseCase;
  final DeleteFavoriteUseCase _deleteFavoriteUseCase;
  final FindFavoriteUseCase _findFavoriteUseCase;
  FavoriteCocktails(this._insertFavoriteUseCase, this._retrieveFavoriteUseCase,
      this._deleteFavoriteUseCase, this._findFavoriteUseCase);

  List<CocktailEntity> get favoriteCocktails {
    return [..._favoriteCocktails];
  }

  List<CocktailEntity> _favoriteCocktails = [];

  bool cocktailFound = false;

  void toggleFavorite(CocktailEntity cocktailEntity) async {
    if (cocktailFound) {
      await _deleteFavoriteUseCase(params: cocktailEntity.drinkId);
      cocktailFound = false;
      notifyListeners();
    } else {
      await _insertFavoriteUseCase(params: cocktailEntity);
      cocktailFound = true;
      notifyListeners();
    }
  }

  Future<void> retrieveFavoriteList() async {
    try {
      _favoriteCocktails = await _retrieveFavoriteUseCase(params: "");
      notifyListeners();
    } catch (e) {
      throw ("Si è verificato un errore");
    }
  }

  void initFavorites(String drinkId) async {
    cocktailFound = await _findFavoriteUseCase(params: drinkId);
    notifyListeners();
  }
}
