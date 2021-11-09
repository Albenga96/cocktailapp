import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/views/result_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrinkSelector extends StatelessWidget {
  const DrinkSelector({
    Key? key,
    required this.text,
    required this.asset,
    required this.filter,
    required this.fetchCocktails,
  }) : super(key: key);

  final String text;
  final String asset;
  final String filter;
  final AsyncCallback fetchCocktails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => ResultView(
              title: text,
              filter: filter,
              fetchCocktails: fetchCocktails,
            ),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: CocktailsColors.cocktailAccentColor,
            radius: CocktailSizes.sizebig,
            child: Padding(
              padding: const EdgeInsets.all(
                CocktailsMargins.coctailsMarginVerySmall,
              ),
              child: CircleAvatar(
                radius: CocktailSizes.sizebig,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(
                    CocktailsMargins.coctailsMarginSmall,
                  ),
                  child: SvgPicture.asset(
                    asset,
                    color: CocktailsColors.cocktailsPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: CocktailsMargins.cocktailMarginMedium,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: cocktailsLightTheme().textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
