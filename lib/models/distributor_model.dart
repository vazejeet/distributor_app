

class DistributorModel {
  final String businessName;
  final String? address;
  final String? status;
  final String? id;
  final String? img;
  final String? type;
  final String? businessType;
  final String? gstNo;
  final String? pincode;
  final String? name;
  final String? mobile;
  final String? state;
  final String? city;
  final String? regionId;
  final String? areaId;
  final String? appPk;
  final String? bankAccountId;
  final String? isApproved;
  final String? openTime;
  final String? closeTime;
  final String? parentId;
  final String? isAsync;
  final String? brands;
  final String? isDelete;
  final String? userId;

  DistributorModel({
    required this.businessName,
    this.userId,
    this.address,
    this.status,
    this.id,
    this.img,
    this.type,
    this.businessType,
    this.gstNo,
    this.pincode,
    this.name,
    this.mobile,
    this.state,
    this.city,
    this.regionId,
    this.areaId,
    this.appPk,
    this.bankAccountId,
    this.isApproved,
    this.openTime,
    this.closeTime,
    this.parentId,
    this.isAsync,
    this.brands,
    this.isDelete,
  });

  factory DistributorModel.fromJson(Map<String, dynamic> json) {
    return DistributorModel(
      businessName: json['business_name'] ?? '',
      address: json['address'],
      status: json['isApproved'] == '1' ? 'Approved' : 'Pending',
      id: json['id'],
      img: json['image'],
      type: json['type'],
      businessType: json['business_type'],
      gstNo: json['gst_no'],
      pincode: json['pincode'],
      name: json['name'],
      mobile: json['mobile'],
      state: json['state'],
      city: json['city'],
      regionId: json['region_id'],
      areaId: json['area_id'],
      appPk: json['app_pk'],
      bankAccountId: json['bank_account_id'],
      isApproved: json['isApproved'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
      parentId: json['parent_id'],
      isAsync: json['is_async'],
      brands: json['brands'],
      isDelete: json['is_delete'],
    );
  }
}