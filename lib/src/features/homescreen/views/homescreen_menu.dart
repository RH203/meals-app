import 'package:flutter/material.dart';
import 'package:meals_app/src/common/widget/cards/menu_cards.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/features/homescreen/models/detail_meal_model.dart';
import 'package:meals_app/src/service/service_api.dart';
import 'package:meals_app/src/utils/app_logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomescreenMenu extends StatefulWidget {
  const HomescreenMenu({super.key});

  @override
  State<HomescreenMenu> createState() => _HomescreenMenuState();
}

class _HomescreenMenuState extends State<HomescreenMenu> {
  final _service = ServiceApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<DetailMealModel>>>(
      future: _service.fetchMealData(Constant.randomMealUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverFillRemaining(
            child: Skeletonizer(
              enabled: true,
              child: GridView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 320,
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
          return SliverFillRemaining(
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return SliverFillRemaining(
            child: const Center(child: Text('No data available')),
          );
        } else {
          final allMeals = snapshot.data!.expand((i) => i).toList();

          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 320,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final meal = allMeals[index];
                AppLogger.debug(meal.mealImage);
                return Container(
                  decoration: BoxDecoration(),
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
              childCount: allMeals.length,
            ),
          );
        }
      },
    );
  }
}
