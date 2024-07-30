import 'package:dio/dio.dart';
import 'package:meals_app/src/features/homescreen/models/food_category_model.dart';
import 'package:meals_app/src/utils/app_logger.dart';

class ServiceApi {
  final _dio = Dio();

  Future<List<FoodCategoryModel>> fetchCategoryData(String url) async {
    try {
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> categoriesJson = response.data['categories'];
        List<FoodCategoryModel> categories =
            categoriesJson.map((json) => FoodCategoryModel.fromJson(json)).toList();
        // AppLogger.debug(categories);
        return categories;
      } else {
        AppLogger.error("Failed to fetch: ${response.statusCode}");
        throw Exception("Failed to fetch: ${response.statusCode}");
      }
    } on DioException catch (error) {
      AppLogger.error("Error DIO: $error");
      throw Exception("Error DIO: $error");
    } catch (error) {
      AppLogger.error("Error when fetching Category data: $error");
      throw Exception("Error when fetching Category data: $error");
    }
  }
}
