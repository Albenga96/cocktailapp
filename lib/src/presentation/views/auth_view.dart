import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_margins.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/core/utils/auth/auth_with_fingerprint.dart';
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
              tag: "app-title",
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
                final isAuthenticated = await AuthenticationWithFingerprint()
                    .authenticateWithFingerprint();
                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(
                          seconds: 2,
                        ),
                        pageBuilder: (_, __, ___) => HomeView()),
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
                  Strings.authText,
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
