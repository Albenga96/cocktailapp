import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:cocktailapp/src/presentation/widgets/home/drink_selector.dart';

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
        title: Hero(
          tag: 'title',
          child: Text(
            Strings.homePageTitleText,
            style: cocktailsLightTheme().textTheme.headline6,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CocktailsMargins.cocktailMarginBig,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  CocktailSizes.sizeSmall,
                ),
              ),
              elevation: CocktailsMargins.coctailsMarginSmall,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CocktailsMargins.cocktailMarginMedium,
                  horizontal: CocktailsMargins.cocktailMarginBig,
                ),
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                    hintText: Strings.searchCocktailText,
                    hintStyle: cocktailsLightTheme().textTheme.headline3,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  DrinkSelector(
                    text: "Alcolici",
                    asset: "assets/images/drink.svg",
                    filter: "Alcoholic",
                  ),
                  DrinkSelector(
                    text: "Analcolici",
                    asset: "assets/images/analcoholic.svg",
                    filter: "Non_Alcoholic",
                  )
                ],
              ),
              SizedBox(
                height: CocktailSizes.sizebig,
              ),
              DrinkSelector(
                text: "Scegli tu per me",
                asset: "assets/images/random.svg",
                filter: "Alcoholic",
              )
            ],
          ),
        ],
      ),
    );
  }
}
