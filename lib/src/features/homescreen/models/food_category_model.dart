class FoodCategoryModel {
  final int idCategory;
  final String nameCategory;
  final String imageCategory;

  FoodCategoryModel({
    required this.idCategory,
    required this.imageCategory,
    required this.nameCategory,
  });

  factory FoodCategoryModel.fromJson(Map<String, dynamic> json) {
    return FoodCategoryModel(
      idCategory: int.parse(json["idCategory"]),
      nameCategory: json["strCategory"] as String,
      imageCategory: json["strCategoryThumb"] as String,
    );
  }
}
