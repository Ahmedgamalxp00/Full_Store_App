class MyFavoriteModel {
  int? favoritesId;
  int? favoritesUsersid;
  int? favoritesItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsCreateat;
  int? itemsCategory;
  int? usersId;
  int? itemsPriceAfterDiscount;

  MyFavoriteModel(
      {this.favoritesId,
      this.favoritesUsersid,
      this.favoritesItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCreateat,
      this.itemsCategory,
      this.usersId,
      this.itemsPriceAfterDiscount});

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) =>
      MyFavoriteModel(
        favoritesId: json['favorites_id'] as int?,
        favoritesUsersid: json['favorites_usersid'] as int?,
        favoritesItemsid: json['favorites_itemsid'] as int?,
        itemsId: json['items_id'] as int?,
        itemsName: json['items_name'] as String?,
        itemsNameAr: json['items_name_ar'] as String?,
        itemsDesc: json['items_desc'] as String?,
        itemsDescAr: json['items_desc_ar'] as String?,
        itemsImage: json['items_image'] as String?,
        itemsCount: json['items_count'] as int?,
        itemsActive: json['items_active'] as int?,
        itemsPrice: json['items_price'] as int?,
        itemsDiscount: json['items_discount'] as int?,
        itemsCreateat: json['items_createat'] as String?,
        itemsCategory: json['items_category'] as int?,
        usersId: json['users_id'] as int?,
        itemsPriceAfterDiscount: json['itemspriceaferdiscount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'favorites_id': favoritesId,
        'favorites_usersid': favoritesUsersid,
        'favorites_itemsid': favoritesItemsid,
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
        'items_createat': itemsCreateat,
        'items_category': itemsCategory,
        'users_id': usersId,
        'itemspriceaferdiscount': itemsPriceAfterDiscount
      };
}
