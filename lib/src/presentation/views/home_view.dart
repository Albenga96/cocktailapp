import 'package:cocktailapp/src/presentation/views/qr_view.dart';
import 'package:cocktailapp/src/presentation/widgets/common/error_dialog.dart';
import 'package:cocktailapp/src/presentation/widgets/home/select_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:cocktailapp/src/presentation/widgets/home/drink_selector.dart';
import 'package:cocktailapp/src/presentation/widgets/home/random_cocktail.dart';

import '../../config/themes/app_theme.dart';
import '../../config/themes/cocktails_colors.dart';
import '../widgets/home/cocktail_drawer.dart';
import 'category_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Future<void> _fetchAlcoholicCocktails(BuildContext context) async {
    try {
      await Provider.of<Cocktails>(context, listen: false)
          .fetchAlcoholicCocktails();
    } catch (e) {
      showDialog(context: context, builder: (ctx) => ErrorDialog());
    }
  }

  Future<void> _fetchCategoryCocktails(BuildContext context) async {
    try {
      await Provider.of<Cocktails>(context, listen: false)
          .fetchCategoryCocktails();
    } catch (e) {
      showDialog(context: context, builder: (ctx) => ErrorDialog());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (cxt) => QrView()));
        },
        backgroundColor: CocktailsColors.cocktailAccentColor,
        child: Icon(Icons.qr_code),
        tooltip: "Qr_Scan",
      ),
      drawer: const CocktailDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Hero(
          tag: "app-title",
          child: Text(
            Strings.homePageTitleText,
            style: cocktailsLightTheme().textTheme.headline6,
          ),
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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DrinkSelector(
                    text: Strings.alcoholicText,
                    asset: "assets/images/drink.svg",
                    filter: "Alcoholic",
                    fetchCocktails: () => _fetchAlcoholicCocktails(context),
                  ),
                  DrinkSelector(
                    text: Strings.nonAlcoholicText,
                    asset: "assets/images/analcoholic.svg",
                    filter: "Non_Alcoholic",
                    fetchCocktails: () => _fetchAlcoholicCocktails(context),
                  )
                ],
              ),
              SizedBox(
                height: CocktailSizes.sizebig,
              ),
              RandomCocktail(
                asset: "assets/images/random.svg",
                text: Strings.randomText,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SelectSearch(
                text: Strings.searchByNameText,
                isNameSearch: true,
              ),
              SizedBox(
                height: CocktailSizes.sizeMedium,
              ),
              SelectSearch(
                text: Strings.searchByIngredientText,
                isNameSearch: false,
              )
            ],
          )
        ],
      ),
    );
  }
}
