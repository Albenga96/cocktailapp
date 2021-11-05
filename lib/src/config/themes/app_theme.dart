import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_text_sizes.dart';
import 'package:flutter/material.dart';

ThemeData cocktailsLightTheme() => ThemeData(
      primaryColor: CocktailsColors.cocktailsPrimaryColor,
      scaffoldBackgroundColor: CocktailsColors.cocktailsSecondaryColor,
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontSize: CocktailTextSizes.textBig,
          color: CocktailsColors.cocktailsPrimaryColor,
        ),
      ),
    );
