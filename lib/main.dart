import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categorias_meals_screen.dart';
import 'package:meals/screens/meals_detail_screen.dart';
import 'models/meals.dart';
import 'data/dummy_data.dart';
import 'screens/setting_screen.dart';

import 'utils/app_routes.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Settings settings) {
    setState(() {
      _availableMeals = DUMMY_MEALS.where(
        (meal) {
          final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
          final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
          final filterVegan = settings.isVegan && !meal.isVegan;
          final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
          return !filterGluten &&
              !filterLactose &&
              !filterVegan &&
              !filterVegetarian;
        },
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: const CategoriesScreen(),
      routes: {
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDeatailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(_filterMeals),
      },
    );
  }
}
