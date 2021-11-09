import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/presentation/utils/category.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:cocktailapp/src/presentation/widgets/home/drink_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final AsyncCallback fetchCocktails;

  const CategoryView({
    Key? key,
    required this.fetchCocktails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          Strings.categoryText,
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: CocktailsMargins.cocktailMarginBig,
        ),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: CocktailsMargins.cocktailMarginMedium,
          ),
          children: List.generate(
            category.length,
            (index) => DrinkSelector(
              text: category[index].name,
              asset: category[index].asset,
              filter: category[index].filter,
              fetchCocktails: fetchCocktails,
            ),
          ),
        ),
      ),
    );
  }
}
