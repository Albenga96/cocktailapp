import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final String title;

  const ResultView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          title,
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: ListView(),
    );
  }
}
