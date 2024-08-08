import 'package:flutter/material.dart';
import 'package:meals_app/src/common/widget/cards/menu_cards.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/features/homescreen/models/detail_meal_model.dart';
import 'package:meals_app/src/service/service_api.dart';
import 'package:meals_app/src/utils/app_logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecipeOfTheDay extends StatefulWidget {
  const RecipeOfTheDay({super.key});

  @override
  State<RecipeOfTheDay> createState() => _RecipeOfTheDayState();
}

class _RecipeOfTheDayState extends State<RecipeOfTheDay> {
  final _service = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<List<DetailMealModel>>>(
        future: _service.fetchMealData(Constant.randomMealUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 290,
              child: Skeletonizer(
                enabled: true,
                child: GridView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 100,
                        height: 270,
                        color: Colors.grey[300],
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final allMeals = snapshot.data!.expand((i) => i).toList();

            return SizedBox(
              height: 290,
              child: GridView.builder(
                itemCount: allMeals.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (context, index) {
                  final meal = allMeals[index];
                  AppLogger.debug(meal.mealImage);
                  return Container(
                    decoration: BoxDecoration(
                      color: Constant.warmWhite,
                    ),
                    child: MenuCards(
                      title: meal.nameMeal,
                      country: meal.mealRegion,
                      image: meal.mealImage,
                      tags: meal.mealTags,
                      onTap: () =>
                          AppLogger.debug("Card onTap: [${meal.nameMeal}]"),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
