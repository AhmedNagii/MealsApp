import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals_app/screens/filtersScreen.dart';
import './screens/taps_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Color.fromARGB(225, 249, 170, 51),
        // canvasColor: Color.fromARGB(225, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold)),
      ),
      initialRoute: "/", //default is "/"
      // home: TabsScreen(),
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routName: (ctx) => FiltersScreen(),
      },

      // if we do not have onGenerateRoute even or unknown rout so,
      // we stil can show something on he  screen
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
    );
  }
}

//it can be used if we want handle case have an issue
// to move to another page we do not ecoect
// onGenerateRoute: (settings) {
//   print(settings.arguments);
//   if(settings.name == "/meal-detail"){
//     return MaterialPageRoute(builder: (ctx)=> CategoriesScreen());
//   }}
