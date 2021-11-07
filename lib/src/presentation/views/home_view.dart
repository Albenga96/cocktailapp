import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:cocktailapp/src/presentation/widgets/home/drink_selector.dart';
import 'package:provider/provider.dart';

import '../../config/themes/app_theme.dart';
import '../../config/themes/cocktails_colors.dart';
import '../widgets/home/cocktail_drawer.dart';
import 'package:flutter/material.dart';

import 'category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _fetchAlcoholicCocktails(BuildContext context) async {
    await Provider.of<Cocktails>(context, listen: false)
        .fetchAlcoholicCocktails();
  }

  Future<void> _fetchCategoryCocktails(BuildContext context) async {
    await Provider.of<Cocktails>(context, listen: false)
        .fetchCategoryCocktails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CocktailDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          Strings.homePageTitleText,
          style: cocktailsLightTheme().textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => CategoryView(
                    fetchCocktails: () => _fetchCategoryCocktails(context),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.filter_list,
            ),
          ),
        ],
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
                children: [
                  DrinkSelector(
                    text: "Alcolici",
                    asset: "assets/images/drink.svg",
                    filter: "Alcoholic",
                    fetchCocktails: () => _fetchAlcoholicCocktails(context),
                  ),
                  DrinkSelector(
                    text: "Analcolici",
                    asset: "assets/images/analcoholic.svg",
                    filter: "Non_Alcoholic",
                    fetchCocktails: () => _fetchAlcoholicCocktails(context),
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
                fetchCocktails: () => _fetchAlcoholicCocktails(context),
              )
            ],
          ),
        ],
      ),
    );
  }
}
