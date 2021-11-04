import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class CocktailsApp extends StatelessWidget {
  const CocktailsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktails',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
