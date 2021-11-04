import 'dart:convert';
import 'dart:async';

import 'package:cocktailapp/models/cocktail.dart';
import 'package:cocktailapp/models/cocktail_info.dart';
import 'package:http/http.dart';

class CoktailApiProvider {
  static const baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<List<CocktailInfo>> getDrinkOptions(String search) async {
    String url = '${baseUrl}filter.php?${search}';

    Uri uri = Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body)['drinks'];
      List<CocktailInfo> coktailsInfo = items.map<CocktailInfo>((json) {
        return CocktailInfo.fromJson(json);
      }).toList();
      return coktailsInfo;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<Cocktail> getDrinkDetails(String id) async {
    String url = '${baseUrl}lookup.php?i=${id}';

    Uri uri = Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      Cocktail cocktail = Cocktail.fromJson(items);
      return cocktail;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<Cocktail> getDrinkRandom() async {
    String url = '${baseUrl}random.php';

    Uri uri = Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      Cocktail cocktail = Cocktail.fromJson(item);
      return cocktail;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<List<Cocktail>> searchCoktailsByName(String name) async {
    String url = '${baseUrl}search.php?s=$name';

    Uri uri = Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      List<Cocktail> cocktails = items.map<Cocktail>((json) {
        return CocktailInfo.fromJson(json);
      }).toList();
      return cocktails;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<List<Cocktail>> searchCoktailsByIngredients(String ingredient) async {
    String url = '${baseUrl}search.php?i=$ingredient';

    Uri uri = Uri.parse(url);

    Response response = await get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body);
      List<Cocktail> cocktails = items.map<Cocktail>((json) {
        return CocktailInfo.fromJson(json);
      }).toList();
      return cocktails;
    } else {
      throw Exception('No internet connection');
    }
  }
}
