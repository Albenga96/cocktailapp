import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_text_sizes.dart';
import 'package:cocktailapp/src/core/utils/constant.dart';
import 'package:flutter/material.dart';

ThemeData cocktailsLightTheme() => ThemeData(
      fontFamily: kNunitoFontName,
      primaryColor: CocktailsColors.cocktailsSecondaryColor,
      scaffoldBackgroundColor: CocktailsColors.cocktailsPrimaryColor,
      textTheme: const TextTheme(
        headline6: TextStyle(
          fontFamily: kAllisonFontName,
          fontSize: CocktailTextSizes.textHuge,
          color: CocktailsColors.cocktailsSecondaryColor,
        ),
        headline4: TextStyle(
          fontSize: CocktailTextSizes.textMedium,
          color: CocktailsColors.cocktailsSecondaryColor,
        ),
        headline3: TextStyle(
          fontSize: CocktailTextSizes.textMedium,
          color: CocktailsColors.cocktailsPrimaryColor,
        ),
        headline2: TextStyle(
          fontSize: CocktailTextSizes.textSmall,
          color: CocktailsColors.cocktailsSecondaryColor,
        ),
        headline1: TextStyle(
          fontSize: CocktailTextSizes.textSmall,
          color: CocktailsColors.cocktailsPrimaryColor,
        ),
      ),
    );
