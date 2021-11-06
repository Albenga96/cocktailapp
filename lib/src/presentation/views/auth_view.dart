import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/data/datasources/local/local_data_source_impl.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:cocktailapp/src/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'title',
              child: Text(
                Strings.homePageTitleText,
                style: cocktailsLightTheme().textTheme.headline6,
              ),
            ),
            SizedBox(
              height: CocktailSizes.sizeMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                final isAuthenticated =
                    await LocalDataSourceImpl().authenticateWithFingerprint();
                if (isAuthenticated) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => HomeView(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: CocktailsColors.cocktailAccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    CocktailSizes.sizeSmall,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CocktailsMargins.cocktailMarginBig,
                  vertical: CocktailsMargins.coctailsMarginSmall,
                ),
                child: Text(
                  "Accedi",
                  style: cocktailsLightTheme().textTheme.headline3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
