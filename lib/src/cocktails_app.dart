import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:cocktailapp/src/presentation/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CocktailsApp extends StatelessWidget {
  const CocktailsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Cocktails(
            GetIt.instance.get(),
            GetIt.instance.get(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cocktails',
        theme: cocktailsLightTheme(),
        home: AuthView(),
      ),
    );
  }
}
