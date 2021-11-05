import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/config/themes/cocktails_sizes.dart';
import 'package:flutter/material.dart';

class CocktailDrawer extends StatelessWidget {
  const CocktailDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: CircleAvatar(
                backgroundColor: CocktailsColors.cocktailsPrimaryColor,
                radius: CocktailSizes.sizebig,
                child: Icon(
                  Icons.photo,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Preferiti",
              style: cocktailsLightTheme().textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
