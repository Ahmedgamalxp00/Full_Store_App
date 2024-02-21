class OrderModel {
	int? ordersId;
	int? ordersUsersid;
	int? ordersAddress;
	int? ordersDeliveryType;
	int? oredersPaymentMethod;
	int? ordersDeliveryPrice;
	int? ordersPrice;
	int? ordersTotalprice;
	int? ordersCoupon;
	int? ordersDiscount;
	int? ordersStatus;
	String? ordersDatetime;
	int? adressId;
	int? adressUsersid;
	String? adressName;
	String? adressCity;
	String? adressStreet;
	double? adressLat;
	double? adressLong;

	OrderModel({
		this.ordersId, 
		this.ordersUsersid, 
		this.ordersAddress, 
		this.ordersDeliveryType, 
		this.oredersPaymentMethod, 
		this.ordersDeliveryPrice, 
		this.ordersPrice, 
		this.ordersTotalprice, 
		this.ordersCoupon, 
		this.ordersDiscount, 
		this.ordersStatus, 
		this.ordersDatetime, 
		this.adressId, 
		this.adressUsersid, 
		this.adressName, 
		this.adressCity, 
		this.adressStreet, 
		this.adressLat, 
		this.adressLong, 
	});

	factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
				ordersId: json['orders_id'] as int?,
				ordersUsersid: json['orders_usersid'] as int?,
				ordersAddress: json['orders_address'] as int?,
				ordersDeliveryType: json['orders_delivery_type'] as int?,
				oredersPaymentMethod: json['oreders_payment_method'] as int?,
				ordersDeliveryPrice: json['orders_delivery_price'] as int?,
				ordersPrice: json['orders_price'] as int?,
				ordersTotalprice: json['orders_totalprice'] as int?,
				ordersCoupon: json['orders_coupon'] as int?,
				ordersDiscount: json['orders_discount'] as int?,
				ordersStatus: json['orders_status'] as int?,
				ordersDatetime: json['orders_datetime'] as String?,
				adressId: json['adress_id'] as int?,
				adressUsersid: json['adress_usersid'] as int?,
				adressName: json['adress_name'] as String?,
				adressCity: json['adress_city'] as String?,
				adressStreet: json['adress_street'] as String?,
				adressLat: (json['adress_lat'] as num?)?.toDouble(),
				adressLong: (json['adress_long'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'orders_id': ordersId,
				'orders_usersid': ordersUsersid,
				'orders_address': ordersAddress,
				'orders_delivery_type': ordersDeliveryType,
				'oreders_payment_method': oredersPaymentMethod,
				'orders_delivery_price': ordersDeliveryPrice,
				'orders_price': ordersPrice,
				'orders_totalprice': ordersTotalprice,
				'orders_coupon': ordersCoupon,
				'orders_discount': ordersDiscount,
				'orders_status': ordersStatus,
				'orders_datetime': ordersDatetime,
				'adress_id': adressId,
				'adress_usersid': adressUsersid,
				'adress_name': adressName,
				'adress_city': adressCity,
				'adress_street': adressStreet,
				'adress_lat': adressLat,
				'adress_long': adressLong,
			};
}
