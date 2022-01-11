import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meal';
  List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    // final routeArgs =
    //     ModalRoute.of(context).settings.arguments as Map<String, String>;
    // we can not use context in initstate because it is created too early before the conext is set up
    // categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];
    // displayedMeals = DUMMY_MEALS
    //     .where((meals) => meals.categories.contains(categoryId))
    //     .toList();
    // TODO: implement initState
    super.initState();
  }

//latest version
  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals
        .where((meals) => meals.categories.contains(categoryId))
        .toList();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //it is called when the dependecies changes or when the and also when the attached widget changes
  //so when the set state is called up didchangedependcies also get called and list again updates
  //but in the latest version it works
//old version
  // var loaded = false;

  // @override
  // void didChangeDependencies() {
  //   if (!loaded) {
  //     final routeArgs =
  //         ModalRoute.of(context).settings.arguments as Map<String, String>;
  //     categoryTitle = routeArgs['title'];
  //     final categoryId = routeArgs['id'];
  //     displayedMeals = DUMMY_MEALS
  //         .where((meals) => meals.categories.contains(categoryId))
  //         .toList();
  //     loaded = true;
  //   }

  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  void removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                removeItem: removeItem,
                id: displayedMeals[index].id,
                title: displayedMeals[index].title,
                imageUrl: displayedMeals[index].imageUrl,
                duration: displayedMeals[index].duration,
                affordablity: displayedMeals[index].affordability,
                complexity: displayedMeals[index].complexity);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
// Called when a dependency of this State object changes.

// For example, if the previous call to build referenced an InheritedWidget
//  that later changed, the framework would call this method to notify this object about the change.
