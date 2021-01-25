import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'glutenFree': false,
    'lactoseFree': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> savedFilters) {
    setState(() {
      _filters = savedFilters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        } else if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        } else if (_filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        } else if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        } else {
          return true;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.yellow,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.grey[900],
              ),
              bodyText2: TextStyle(
                color: Colors.grey[900],
              ),
              headline6: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_setFilters, _filters),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => TabsScreen(),
      ),
    );
  }
}
