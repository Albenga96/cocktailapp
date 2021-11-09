import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/config/themes/cocktails_colors.dart';
import 'package:cocktailapp/src/presentation/utils/strings.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CocktailsColors.cocktailsSecondaryColor,
      title: Text(
        Strings.errorTitleText,
        style: cocktailsLightTheme().textTheme.headline3,
      ),
      content: Text(
        Strings.errorDialogText,
        style: cocktailsLightTheme().textTheme.headline3,
      ),
    );
  }
}
