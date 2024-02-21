class NotificationModel {
	int? notificationId;
	String? notificationTitle;
	String? notificationBody;
	int? notificationUsersid;
	String? notificationDatetime;

	NotificationModel({
		this.notificationId, 
		this.notificationTitle, 
		this.notificationBody, 
		this.notificationUsersid, 
		this.notificationDatetime, 
	});

	factory NotificationModel.fromJson(Map<String, dynamic> json) {
		return NotificationModel(
			notificationId: json['notification_id'] as int?,
			notificationTitle: json['notification_title'] as String?,
			notificationBody: json['notification_body'] as String?,
			notificationUsersid: json['notification_usersid'] as int?,
			notificationDatetime: json['notification_datetime'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'notification_id': notificationId,
				'notification_title': notificationTitle,
				'notification_body': notificationBody,
				'notification_usersid': notificationUsersid,
				'notification_datetime': notificationDatetime,
			};
}
