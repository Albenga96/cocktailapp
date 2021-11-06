import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultView extends StatefulWidget {
  final String title;

  const ResultView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  void initState() {
    Provider.of<Cocktails>(context, listen: false).filter = "Alcoholic";

    super.initState();
  }

  Future<void> _refreshCocktails(BuildContext context) async {
    await Provider.of<Cocktails>(context, listen: false)
        .fetchAlcoholicCocktails();
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
      body: ListView(),
    );
  }
}
