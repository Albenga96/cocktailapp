import 'package:cached_network_image/cached_network_image.dart';
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
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<Cocktails>(
                    builder: (ctx, cocktailsData, _) => ListView.builder(
                        itemExtent: 100,
                        itemCount: cocktailsData.cocktails.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  CocktailsColors.cocktailsSecondaryColor,
                              child: CachedNetworkImage(
                                imageUrl: cocktailsData
                                    .cocktails[index].drinkThumbnail,
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      CocktailsColors.cocktailAccentColor,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              cocktailsData.cocktails[index].drinkName,
                              style: cocktailsLightTheme().textTheme.headline4,
                            ),
                          );
                        }),
                  ),
      ),
    );
  }
}
