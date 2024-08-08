import 'package:flutter/material.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/features/homescreen/models/food_category_model.dart';
import 'package:meals_app/src/service/service_api.dart';
import 'package:meals_app/src/utils/app_logger.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _service = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<FoodCategoryModel>>(
        future: _service.fetchCategoryData(Constant.categoryUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: 80,
              child: Skeletonizer(
                enabled: true,
                child: GridView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    return IconButton.outlined(
                      onPressed: () {},
                      icon: Container(
                        width: 50,
                        height: 50,
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return SizedBox(
              height: 80,
              child: GridView.builder(
                itemCount: snapshot.data!.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  FoodCategoryModel category = snapshot.data![index];
                  return IconButton.outlined(
                    onPressed: () {
                      AppLogger.debug("Category button pressed [$index]");
                    },
                    style: IconButton.styleFrom(
                        backgroundColor: Constant.warmWhite),
                    icon: Constant.categoryIcons[category.nameCategory]!,
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
