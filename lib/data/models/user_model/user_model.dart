class UserModel {
  int? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersPassword;
  int? usersVerifycode;
  String? usersImage;
  int? usersApprove;
  String? usersCreate;

  UserModel({
    this.usersId,
    this.usersName,
    this.usersEmail,
    this.usersPhone,
    this.usersPassword,
    this.usersVerifycode,
    this.usersImage,
    this.usersApprove,
    this.usersCreate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        usersId: json['users_id'] as int?,
        usersName: json['users_name'] as String?,
        usersEmail: json['users_email'] as String?,
        usersPhone: json['users_phone'] as String?,
        usersPassword: json['users_password'] as String?,
        usersVerifycode: json['users_verifycode'] as int?,
        usersImage: json['users_image'] as String?,
        usersApprove: json['users_approve'] as int?,
        usersCreate: json['users_create'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'users_id': usersId,
        'users_name': usersName,
        'users_email': usersEmail,
        'users_phone': usersPhone,
        'users_password': usersPassword,
        'users_verifycode': usersVerifycode,
        'users_image': usersImage,
        'users_approve': usersApprove,
        'users_create': usersCreate,
      };
}
