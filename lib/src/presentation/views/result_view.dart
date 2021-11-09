import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/views/detail_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';

class ResultView extends StatefulWidget {
  final String title;
  final String filter;
  final AsyncCallback fetchCocktails;

  const ResultView({
    Key? key,
    required this.title,
    required this.filter,
    required this.fetchCocktails,
  }) : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  void initState() {
    Provider.of<Cocktails>(context, listen: false).filter = widget.filter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CocktailsColors.cocktailsPrimaryColor,
        title: Text(
          widget.title,
          style: cocktailsLightTheme().textTheme.headline6,
        ),
      ),
      body: FutureBuilder(
        future: widget.fetchCocktails(),
        builder: (context, snapshot) => snapshot.connectionState ==
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
                                  drinkId:
                                      cocktailsData.cocktails[index].drinkId,
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
                                  cocktailsData.cocktails[index].drinkName,
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
