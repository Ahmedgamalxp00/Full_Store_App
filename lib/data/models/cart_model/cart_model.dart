class CartModel {
  int? itemspricetotal;
  int? itemscounttotal;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
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
  String? itemsCreateat;
  int? itemsCategory;

  CartModel(
      {this.itemspricetotal,
      this.itemscounttotal,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
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
      this.itemsPriceAfterDiscount});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        itemspricetotal: json['itemsprice'] as int?,
        itemscounttotal: json['itemscount'] as int?,
        cartId: json['cart_id'] as int?,
        cartUsersid: json['cart_usersid'] as int?,
        cartItemsid: json['cart_itemsid'] as int?,
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
        itemsPriceAfterDiscount: json['itemspriceaferdiscount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'itemsprice': itemspricetotal,
        'itemscount': itemscounttotal,
        'cart_id': cartId,
        'cart_usersid': cartUsersid,
        'cart_itemsid': cartItemsid,
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
        'itemspriceaferdiscount': itemsPriceAfterDiscount,
      };
}
