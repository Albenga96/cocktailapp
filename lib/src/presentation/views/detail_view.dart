import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/cocktail_details.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatefulWidget {
  final String drinkId;

  const DetailView({
    Key? key,
    required this.drinkId,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Future<void> _fetchCocktailDetails(BuildContext context) async {
    await Provider.of<CocktailDetails>(context, listen: false)
        .fetchCocktailDetails();
  }

  @override
  void initState() {
    Provider.of<CocktailDetails>(context, listen: false).drinkId =
        widget.drinkId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
      ),
      body: FutureBuilder(
        future: _fetchCocktailDetails(context),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<CocktailDetails>(
                  builder: (ctx, cocktailDetailsData, _) => ListView(
                    children: [
                      Center(
                        child: Text(
                          cocktailDetailsData.cocktailDetails.drinkName,
                          style: cocktailsLightTheme().textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          CocktailsMargins.cocktailMarginBig,
                        ),
                        child: Container(
                          height: CocktailSizes.sizeHuge * 3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                cocktailDetailsData
                                    .cocktailDetails.drinkThumbnail,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              CocktailSizes.sizeMedium,
                            ),
                            color: CocktailsColors.cocktailsSecondaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: CocktailSizes.sizeSmall,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            cocktailDetailsData.cocktailDetails.drinkCategory,
                            style: cocktailsLightTheme().textTheme.headline4,
                          ),
                          Text(
                            cocktailDetailsData.cocktailDetails.drinkAlcoholic,
                            style: cocktailsLightTheme().textTheme.headline4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: CocktailSizes.sizeSmall,
                      ),
                      Center(
                        child: Text(
                          cocktailDetailsData.cocktailDetails.drinkGlass,
                          style: cocktailsLightTheme().textTheme.headline4,
                        ),
                      ),
                      SizedBox(
                        height: CocktailSizes.sizeMedium,
                      ),
                      Center(
                        child: Text(
                          "Ingredienti",
                          style: cocktailsLightTheme().textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        height: CocktailSizes.sizeMedium,
                      ),
                      Center(
                        child: Text(
                          "Istruzioni",
                          style: cocktailsLightTheme().textTheme.headline6,
                        ),
                      ),
                      SizedBox(
                        height: CocktailsMargins.coctailsMarginSmall,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: CocktailsMargins.cocktailMarginMedium,
                            right: CocktailsMargins.cocktailMarginMedium,
                            bottom: CocktailsMargins.cocktailMarginBig,
                          ),
                          child: Text(
                            cocktailDetailsData
                                .cocktailDetails.drinkInstructionsIT,
                            style: cocktailsLightTheme().textTheme.headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
