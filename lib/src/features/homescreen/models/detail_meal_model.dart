class DetailMealModel {
  final int idMeal;
  final int nameMeal, categoryMeal, mealRegion, mealInstructions, mealTags;

  DetailMealModel({
    required this.idMeal,
    required this.nameMeal,
    required this.categoryMeal,
    required this.mealRegion,
    required this.mealInstructions,
    required this.mealTags,
  });

  factory DetailMealModel.fromJson(Map<String, dynamic> json) {
    return DetailMealModel(
        idMeal: int.parse(json["idMeal"]),
        nameMeal: json["strMeal"],
        categoryMeal: json["strCategory"],
        mealRegion: json["strArea"],
        mealInstructions: json["strInstructions"],
        mealTags: json["strTags"]);
  }
}
