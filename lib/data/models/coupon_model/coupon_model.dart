class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? couponExpiredate;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponCount,
    this.couponDiscount,
    this.couponExpiredate,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        couponId: json['coupon_id'] as int?,
        couponName: json['coupon_name'] as String?,
        couponCount: json['coupon_count'] as int?,
        couponDiscount: json['coupon_discount'] as int?,
        couponExpiredate: json['coupon_expiredate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'coupon_id': couponId,
        'coupon_name': couponName,
        'coupon_count': couponCount,
        'coupon_discount': couponDiscount,
        'coupon_expiredate': couponExpiredate,
      };
}
