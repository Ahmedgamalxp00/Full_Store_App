class ItemModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsPriceAfterDiscount;
  int? itemsDiscount;
  int? favorite;
  String? itemsCreateat;
  int? itemsCategory;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesCreateat;

  ItemModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.favorite,
      this.itemsCreateat,
      this.itemsCategory,
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesCreateat,
      this.itemsPriceAfterDiscount});

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        itemsId: json['items_id'] as int?,
        itemsName: json['items_name'] as String?,
        itemsNameAr: json['items_name_ar'] as String?,
        itemsDesc: json['items_desc'] as String?,
        itemsDescAr: json['items_desc_ar'] as String?,
        itemsImage: json['items_image'] as String?,
        itemsCount: json['items_count'] as int?,
        itemsActive: json['items_active'] as int?,
        itemsPrice: json['items_price'] as int?,
        itemsPriceAfterDiscount: json['itemspriceaferdiscount'] as int?,
        itemsDiscount: json['items_discount'] as int?,
        favorite: json['favorite'] as int?,
        itemsCreateat: json['items_createat'] as String?,
        itemsCategory: json['items_category'] as int?,
        categoriesId: json['categories_id'] as int?,
        categoriesName: json['categories_name'] as String?,
        categoriesNameAr: json['categories_name_ar'] as String?,
        categoriesImage: json['categories_image'] as String?,
        categoriesCreateat: json['categories_createat'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'itemspriceaferdiscount': itemsPriceAfterDiscount,
        'items_id': itemsId,
        'items_name': itemsName,
        'items_name_ar': itemsNameAr,
        'items_desc': itemsDesc,
        'items_desc_ar': itemsDescAr,
        'items_image': itemsImage,
        'items_count': itemsCount,
        'items_active': itemsActive,
        'items_price': itemsPrice,
        'items_discount': itemsDiscount,
        'favorite': favorite,
        'items_createat': itemsCreateat,
        'items_category': itemsCategory,
        'categories_id': categoriesId,
        'categories_name': categoriesName,
        'categories_name_ar': categoriesNameAr,
        'categories_image': categoriesImage,
        'categories_createat': categoriesCreateat,
      };
}
