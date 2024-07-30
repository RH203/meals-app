import 'package:flutter/material.dart';
import 'package:meals_app/src/service/service_api.dart';
import 'package:meals_app/src/constant/constant.dart';
import 'package:meals_app/src/features/homescreen/models/food_category_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meals_app/src/utils/app_logger.dart';

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
      child: FutureBuilder(
        future: _service.fetchCategoryData(Constant.categoryUrl),
        builder: (context, snapshot) {
          return SizedBox(
            height: 60,
            child: snapshot.hasData
                ? GridView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      FoodCategoryModel category = snapshot.data![index];
                      AppLogger.debug(snapshot.data);
                      return IconButton.outlined(
                        onPressed: () {
                          AppLogger.debug("Category button pressed");
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Constant.warmWhite, elevation: 0),
                        icon: Container(
                          child: Constant.categoryIcons[category.nameCategory],
                        ),
                      );
                    },
                  )
                : Center(
                    child: LoadingAnimationWidget.flickr(
                      leftDotColor: Constant.darkRed,
                      rightDotColor: Constant.brightRed,
                      size: 70,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
