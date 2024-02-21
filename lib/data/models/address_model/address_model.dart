class AddressModel {
	int? adressId;
	int? adressUsersid;
	String? adressName;
	String? adressCity;
	String? adressStreet;
	double? adressLat;
	double? adressLong;

	AddressModel({
		this.adressId, 
		this.adressUsersid, 
		this.adressName, 
		this.adressCity, 
		this.adressStreet, 
		this.adressLat, 
		this.adressLong, 
	});

	factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
				adressId: json['adress_id'] as int?,
				adressUsersid: json['adress_usersid'] as int?,
				adressName: json['adress_name'] as String?,
				adressCity: json['adress_city'] as String?,
				adressStreet: json['adress_street'] as String?,
				adressLat: (json['adress_lat'] as num?)?.toDouble(),
				adressLong: (json['adress_long'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'adress_id': adressId,
				'adress_usersid': adressUsersid,
				'adress_name': adressName,
				'adress_city': adressCity,
				'adress_street': adressStreet,
				'adress_lat': adressLat,
				'adress_long': adressLong,
			};
}
