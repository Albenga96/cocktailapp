import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/views/detail_view.dart';

class RandomCocktail extends StatelessWidget {
  final String asset;
  final String text;
  const RandomCocktail({
    Key? key,
    required this.asset,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => DetailView(
              drinkId: '',
              isRandom: true,
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
