import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/favorite.dart';
import 'package:cocktailapp/src/presentation/views/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesView extends StatefulWidget {
  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  Future<void> _retrieveFavoriteCocktails(BuildContext context) async {
    await Provider.of<FavoriteCocktails>(context, listen: false)
        .retrieveFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          "Preferiti",
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: StreamBuilder(
        stream: _retrieveFavoriteCocktails(context).asStream(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<FavoriteCocktails>(
                builder: (ctx, cocktailsData, _) => ListView.builder(
                    itemCount: cocktailsData.favoriteCocktails.length,
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
                                      .favoriteCocktails[index].drinkId,
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
                                      .favoriteCocktails[index].drinkThumbnail,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    radius: CocktailSizes.sizeMedium,
                                    backgroundColor:
                                        CocktailsColors.cocktailsSecondaryColor,
                                    backgroundImage: imageProvider,
                                  ),
                                  placeholder: (context, url) => Padding(
                                    padding: EdgeInsets.all(
                                      CocktailsMargins.coctailsMarginSmall,
                                    ),
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          CocktailsColors.cocktailAccentColor),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  cocktailsData
                                      .favoriteCocktails[index].drinkName,
                                  style:
                                      cocktailsLightTheme().textTheme.headline4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
      ),
    );
  }
}
