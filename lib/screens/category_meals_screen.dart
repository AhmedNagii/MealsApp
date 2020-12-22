import 'package:flutter/material.dart';
import '../widgets/meal_Item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
  // final String id;
  // final String title;
  // CategoryMealsScreen(this.id, this.title,);
  @override
  Widget build(BuildContext context) {
    final routsArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routsArgs["title"];
    final categoryId = routsArgs["id"];

    final categoriesMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: categoriesMeals[index].title,
              duration: categoriesMeals[index].duration,
              imageUrl: categoriesMeals[index].imageUrl,
              affordability: categoriesMeals[index].affordability,
              complexity: categoriesMeals[index].complexity,
            );
          },
          itemCount: categoriesMeals.length,
        ),
      ),
    );
  }
}
