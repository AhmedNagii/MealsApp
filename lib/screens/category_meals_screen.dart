import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_Item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availbleMeals;

  CategoryMealsScreen(this.availbleMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  bool _lodedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_lodedInitData) {
      final routsArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routsArgs["title"];
      final categoryId = routsArgs["id"];
      displayedMeal = widget.availbleMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _lodedInitData = true;
    }

    super.didChangeDependencies();
  }

  // void _removeItem(String mealId) {
  //   setState(() {
  //     displayedMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayedMeal[index].id,
              title: displayedMeal[index].title,
              duration: displayedMeal[index].duration,
              imageUrl: displayedMeal[index].imageUrl,
              affordability: displayedMeal[index].affordability,
              complexity: displayedMeal[index].complexity,
            );
          },
          itemCount: displayedMeal.length,
        ),
      ),
    );
  }
}
