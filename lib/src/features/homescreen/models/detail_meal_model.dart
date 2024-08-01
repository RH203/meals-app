class DetailMealModel {
  final int idMeal;
  final String nameMeal,
      categoryMeal,
      mealRegion,
      mealInstructions,
      mealTags,
      mealImage;

  DetailMealModel({
    required this.idMeal,
    required this.nameMeal,
    required this.categoryMeal,
    required this.mealRegion,
    required this.mealInstructions,
    required this.mealTags,
    required this.mealImage,
  });

  factory DetailMealModel.fromJson(Map<String, dynamic> json) {
    return DetailMealModel(
      idMeal: int.parse(json["idMeal"]),
      nameMeal: json["strMeal"] as String,
      categoryMeal: json["strCategory"] as String,
      mealRegion: json["strArea"] as String,
      mealInstructions: json["strInstructions"] as String,
      mealImage: json["strMealThumb"] as String,
      mealTags: json["strTags"] ?? "null",
    );
  }
}
