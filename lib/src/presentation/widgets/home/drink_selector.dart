import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:flutter/material.dart';

class DrinkSelector extends StatelessWidget {
  const DrinkSelector({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: CocktailSizes.sizebig,
          backgroundColor: Colors.white,
        ),
        const SizedBox(
          height: CocktailsMargins.cocktailMarginMedium,
        ),
        Text(
          text,
          style: cocktailsLightTheme().textTheme.headline4,
        ),
      ],
    );
  }
}
