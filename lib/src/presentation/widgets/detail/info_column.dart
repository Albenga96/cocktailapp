import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({
    Key? key,
    required this.header,
    required this.value,
  }) : super(key: key);

  final String header;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        CocktailsMargins.coctailsMarginSmall,
      ),
      child: Column(
        children: [
          Text(
            header,
            style: cocktailsLightTheme().textTheme.headline6,
          ),
          SizedBox(
            height: CocktailsMargins.coctailsMarginSmall,
          ),
          FittedBox(
            child: Text(
              value,
              style: cocktailsLightTheme().textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}
