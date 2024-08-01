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
        // AppLogger.debug("Fetched categories data successfully: $categories");
        return categories;
      } else {
        AppLogger.error(
            "Failed to fetch [CATEGORY DATA]: ${response.statusCode}");
        throw Exception(
            "Exception failed status code [CATEGORY DATA]: ${response.statusCode}");
      }
    } on DioException catch (error) {
      String? errorMessage = error.message;
      int? statusCode = error.response?.statusCode;
      String statusMessage = error.response?.statusMessage ?? "Unknown error";

      AppLogger.error(
          "DioException: Failed to fetch category data. URL: $url, Status Code: $statusCode, Status Message: $statusMessage, Error Message: $errorMessage");

      throw Exception(
          "Failed to fetch category data from $url. Status Code: $statusCode, Error Message: $errorMessage");
    } catch (error) {
      AppLogger.error(
          "Exception: An error occurred while fetching category data. URL: $url, Error: $error");
      throw Exception(
          "An unexpected error occurred while fetching category data from $url. Error: $error");
    }
  }

  Future<List<List<DetailMealModel>>> fetchMealData(String url) async {
    try {
      List<List<DetailMealModel>> allMeals = [];
      for (int i = 0; i < 10; i++) {
        final Response response = await _dio.get(url);

        if (response.statusCode == 200) {
          List<dynamic> mealJson = response.data["meals"];
          List<DetailMealModel> meals =
              mealJson.map((json) => DetailMealModel.fromJson(json)).toList();
          allMeals.add(meals);
        } else {
          String statusMessage = response.statusMessage ?? "Unknown error";

          AppLogger.error(
              "Failed to fetch meal data. URL: $url, Status Code: ${response.statusCode}, Status Message: $statusMessage");

          throw Exception(
              "Failed to fetch meal data. Server responded with status code ${response.statusCode}: $statusMessage");
        }
      }

      return allMeals;
    } on DioException catch (error) {
      String? errorMessage = error.message;
      int? statusCode = error.response?.statusCode;
      String statusMessage = error.response?.statusMessage ?? "Unknown error";

      AppLogger.error(
          "DioException: Failed to fetch meal data. URL: $url, Status Code: $statusCode, Status Message: $statusMessage, Error Message: $errorMessage");

      throw Exception(
          "Failed to fetch meal data from $url. Status Code: $statusCode, Error Message: $errorMessage");
    } catch (error) {
      AppLogger.error(
          "Exception: An error occurred while fetching meal data. URL: $url, Error: $error");
      throw Exception(
          "An unexpected error occurred while fetching meal data from $url. Error: $error");
    }
  }
}
