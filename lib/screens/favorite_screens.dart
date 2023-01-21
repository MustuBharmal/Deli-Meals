import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meals.dart';

class FavoriteScreens extends StatelessWidget {
  static const routeNamed = '/favorites';
  final List<Meals> favoriteMeals;
  const FavoriteScreens(this.favoriteMeals, {super.key});
  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'You have no favorites yet - Start adding some!',
        ),
      );
    } else{
        return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            );
          },
          itemCount: favoriteMeals.length,
        );
    }
    }

  }
