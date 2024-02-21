class CategoryModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesCreateat;

  CategoryModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesCreateat,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoriesId: json['categories_id'] as int?,
        categoriesName: json['categories_name'] as String?,
        categoriesNameAr: json['categories_name_ar'] as String?,
        categoriesImage: json['categories_image'] as String?,
        categoriesCreateat: json['categories_createat'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'categories_id': categoriesId,
        'categories_name': categoriesName,
        'categories_name_ar': categoriesNameAr,
        'categories_image': categoriesImage,
        'categories_createat': categoriesCreateat,
      };
}
