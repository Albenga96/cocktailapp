import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          "Cerca",
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
    );
  }
}
