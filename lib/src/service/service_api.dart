import 'package:dio/dio.dart';
import 'package:meals_app/src/features/homescreen/models/detail_meal_model.dart';
import 'package:meals_app/src/features/homescreen/models/food_category_model.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class ServiceApi {
  final _dio = Dio();

  Future<List<FoodCategoryModel>> fetchCategoryData(String url) async {
    try {
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> categoriesJson = response.data['categories'];
        List<FoodCategoryModel> categories = categoriesJson
            .map((json) => FoodCategoryModel.fromJson(json))
            .toList();
        // AppLogger.debug(categories);
        return categories;
      } else {
        AppLogger.error(
            "Failed to fetch [CATEGORY DATA]: ${response.statusCode}");
        throw Exception(
            "Exception failed status code [CATEGORY DATA]: ${response.statusCode}");
      }
    } on DioException catch (error) {
      AppLogger.error("Error DIO: $error");
      throw Exception("Error DIO: $error");
    } catch (error) {
      AppLogger.error("Error when fetching [CATEGORY DATA]: $error");
      throw Exception(
          "Exception occured when fetching [CATEGORY DATA]: $error");
    }
  }

  // Future<List<DetailMealModel>> fetchMealData(String url) async {
  //   try {
  //     final Response response = await _dio.get(url);
  //   } catch (error) {
  //     AppLogger.error("Error when fetching [MEAL DATA]: $error");
  //     throw Exception("Exception occured when fetching [MEAL DATA]: $error");
  //   }
  // }
}
