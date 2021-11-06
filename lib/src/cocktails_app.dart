import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/presentation/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'presentation/views/home_view.dart';

class CocktailsApp extends StatelessWidget {
  const CocktailsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktails',
      theme: cocktailsLightTheme(),
      home: AuthView(),
    );
  }
}
