import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class SelectSearch extends StatelessWidget {
  const SelectSearch({
    Key? key,
    required this.text,
    required this.isNameSearch,
  }) : super(key: key);

  final String text;
  final bool isNameSearch;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => SearchView(
              isNameSearch: isNameSearch,
            ),
          ),
        );
      },
      child: Container(
        width: CocktailSizes.sizeVeryHuge,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(
            0.5,
          ),
          borderRadius: BorderRadius.circular(
            CocktailSizes.sizeMedium,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: CocktailSizes.sizeSmall,
                horizontal: CocktailsMargins.cocktailMarginBig,
              ),
              child: Text(
                text,
                style: cocktailsLightTheme().textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
