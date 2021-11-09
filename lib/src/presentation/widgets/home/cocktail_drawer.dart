import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:cocktailapp/src/presentation/views/auth_view.dart';
import 'package:cocktailapp/src/presentation/views/favorites_view.dart';
import 'package:flutter/material.dart';

class CocktailDrawer extends StatelessWidget {
  const CocktailDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                backgroundColor: CocktailsColors.cocktailsPrimaryColor,
                radius: CocktailSizes.sizebig,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => FavoritesView(),
              ),
            ),
            title: Text(
              "Preferiti",
              style: cocktailsLightTheme().textTheme.headline3,
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => AuthView(),
              ),
            ),
            title: Text(
              "Esci",
              style: cocktailsLightTheme().textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
