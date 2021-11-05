import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';

import '../../config/themes/app_theme.dart';
import '../../config/themes/cocktails_colors.dart';
import '../widgets/home/cocktail_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CocktailDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          "Cocktails - EasyPol",
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: CocktailsMargins.coctailsMarginSmall,
            child: TextFormField(
              decoration: const InputDecoration.collapsed(
                hintText: "Cerca un cocktail...",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
