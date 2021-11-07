import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final String title;

  const DetailView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "cocktail-name",
          child: Text(
            title,
            style: cocktailsLightTheme().textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
