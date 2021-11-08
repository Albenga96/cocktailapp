import 'package:cocktailapp/src/di/injector.dart';
import 'package:flutter/material.dart';

import 'src/cocktails_app.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const CocktailsApp());
}
