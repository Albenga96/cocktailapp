import 'package:cocktailapp/src/config/themes/app_theme.dart';
import 'package:cocktailapp/src/presentation/providers/cocktail_details.dart';

import 'package:cocktailapp/src/presentation/providers/cocktails.dart';
import 'package:cocktailapp/src/presentation/views/auth_view.dart';
import 'package:cocktailapp/src/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CocktailsApp extends StatelessWidget {
  const CocktailsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Cocktails(
            GetIt.instance.get(),
            GetIt.instance.get(),
            GetIt.instance.get(),
            GetIt.instance.get(),
          ),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CocktailDetails(
            GetIt.instance.get(),
            GetIt.instance.get(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cocktails',
        theme: cocktailsLightTheme(),
        home: HomeView(), //TODO: put AuthView()
      ),
    );
  }
}
