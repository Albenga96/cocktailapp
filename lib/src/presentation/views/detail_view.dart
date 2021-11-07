import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/providers/cocktail_details.dart';
import 'package:cocktailapp/src/presentation/widgets/detail/info_column.dart';

class DetailView extends StatefulWidget {
  final String drinkId;
  final bool isRandom;

  const DetailView({
    Key? key,
    required this.drinkId,
    required this.isRandom,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Future<void> _fetchCocktailDetails(BuildContext context) async {
    await Provider.of<CocktailDetails>(context, listen: false)
        .fetchCocktailDetails();
  }

  Future<void> _fetchRandomCocktails(BuildContext context) async {
    await Provider.of<CocktailDetails>(context, listen: false)
        .fetchRandomCocktail();
  }

  @override
  void initState() {
    if (!widget.isRandom) {
      Provider.of<CocktailDetails>(context, listen: false).drinkId =
          widget.drinkId;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_sharp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_outline,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
      ),
      body: FutureBuilder(
        future: widget.isRandom
            ? _fetchRandomCocktails(context)
            : _fetchCocktailDetails(context),
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
                          InfoColumn(
                            header: "Cat.",
                            value: cocktailDetailsData
                                .cocktailDetails.drinkCategory,
                          ),
                          InfoColumn(
                            header: "Glass",
                            value:
                                cocktailDetailsData.cocktailDetails.drinkGlass,
                          ),
                          InfoColumn(
                            header: "Type",
                            value: cocktailDetailsData
                                .cocktailDetails.drinkAlcoholic,
                          )
                        ],
                      ),
                      SizedBox(height: CocktailSizes.sizeMedium),
                      Center(
                        child: Text(
                          "Ingredienti",
                          style: cocktailsLightTheme().textTheme.headline6,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cocktailDetailsData
                                  .cocktailDetails.ingredients.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical:
                                      CocktailsMargins.coctailsMarginVerySmall,
                                  horizontal:
                                      CocktailsMargins.cocktailMarginBig,
                                ),
                                child: Text(
                                  cocktailDetailsData
                                      .cocktailDetails.ingredients[index]!,
                                  style:
                                      cocktailsLightTheme().textTheme.headline4,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: cocktailDetailsData
                                    .cocktailDetails.ingredients.length,
                                itemBuilder: (context, index) {
                                  List<String?> measures = [];
                                  int diff = cocktailDetailsData
                                          .cocktailDetails.ingredients.length -
                                      cocktailDetailsData
                                          .cocktailDetails.measures.length;
                                  if (diff == 0) {
                                    measures = cocktailDetailsData
                                        .cocktailDetails.measures;
                                  } else {
                                    measures = cocktailDetailsData
                                        .cocktailDetails.measures;
                                    for (int i = 0; i < diff; i++) {
                                      measures.add("");
                                    }
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: CocktailsMargins
                                          .coctailsMarginVerySmall,
                                      horizontal:
                                          CocktailsMargins.cocktailMarginBig,
                                    ),
                                    child: Text(
                                      measures[index]!,
                                      style: cocktailsLightTheme()
                                          .textTheme
                                          .headline4,
                                    ),
                                  );
                                }),
                          ),
                        ],
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
