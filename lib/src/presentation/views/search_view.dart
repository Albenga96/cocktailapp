import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:flutter/material.dart';

import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:provider/provider.dart';

import 'detail_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    Key? key,
    required this.isNameSearch,
  }) : super(key: key);

  final bool isNameSearch;

  Future<void> _searchCocktailsByName(BuildContext context) async {
    try {
      await Provider.of<Cocktails>(context, listen: false)
          .searchCocktailsByName();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Nessun cocktail",
          ),
        ),
      );
    }
  }

  Future<void> _searchCocktailsByIngredient(BuildContext context) async {
    try {
      await Provider.of<Cocktails>(context, listen: false)
          .searchCocktailsByIngredient();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          "Cerca",
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: CocktailsMargins.cocktailMarginBig,
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
                  onChanged: (value) {
                    if (value.length > 2) {
                      if (isNameSearch) {
                        Provider.of<Cocktails>(context, listen: false).name =
                            value;
                        _searchCocktailsByName(context);
                      } else {
                        Provider.of<Cocktails>(context, listen: false)
                            .ingredient = value;
                        _searchCocktailsByIngredient(context);
                      }
                    }
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: isNameSearch
                        ? Strings.searchCocktailText
                        : Strings.searchCocktailByIngredientsText,
                    hintStyle: cocktailsLightTheme().textTheme.headline3,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: isNameSearch
                  ? _searchCocktailsByName(context)
                  : _searchCocktailsByIngredient(context),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<Cocktails>(
                      builder: (ctx, cocktailsData, _) => ListView.builder(
                          itemCount: cocktailsData.cocktails.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => DetailView(
                                        isRandom: false,
                                        drinkId: cocktailsData
                                            .cocktails[index].drinkId,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  elevation: 12,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      CocktailSizes.sizeMedium,
                                    ),
                                  ),
                                  color: Colors.grey.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      CocktailsMargins.coctailsMarginVerySmall,
                                    ),
                                    child: ListTile(
                                      leading: CachedNetworkImage(
                                        imageUrl: cocktailsData
                                            .cocktails[index].drinkThumbnail,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                CircleAvatar(
                                          radius: CocktailSizes.sizeMedium,
                                          backgroundColor: CocktailsColors
                                              .cocktailsSecondaryColor,
                                          backgroundImage: imageProvider,
                                        ),
                                        placeholder: (context, url) => Padding(
                                          padding: EdgeInsets.all(
                                            CocktailsMargins
                                                .coctailsMarginSmall,
                                          ),
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    CocktailsColors
                                                        .cocktailAccentColor),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        cocktailsData
                                            .cocktails[index].drinkName,
                                        style: cocktailsLightTheme()
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
