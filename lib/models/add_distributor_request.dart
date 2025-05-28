


class AddDistributorRequest {
  final String businessName;
  final String businessType;
  final String gstNo;
  final String address;
  final String pincode;
  final String name;
  final String mobile;
  final String state;
  final String city;
  final String regionId;
  final String areaId;
  final String appPk;
  final String? id;
  final String userId;
  final String bankAccountId;
  final String type;
  final String brandIds;
  final String? imagePath;

  AddDistributorRequest._({
    required this.businessName,
    required this.businessType,
    required this.gstNo,
    required this.address,
    required this.pincode,
    required this.name,
    required this.mobile,
    required this.state,
    required this.city,
    required this.regionId,
    required this.areaId,
    required this.appPk,
    required this.id,
    required this.userId,
    required this.bankAccountId,
    required this.type,
    required this.brandIds,
    this.imagePath,
  });


  factory AddDistributorRequest.create({
    required String businessName,
    required String businessType,
    required String gstNo,
    required String address,
    required String pincode,
    required String name,
    required String mobile,
    required String state,
    required String city,
    required String regionId,
    required String areaId,
    required String appPk,
    required String userId,
    required String bankAccountId,
    required String type,
    required String brandIds,
    String? imagePath,
  }) {
    return AddDistributorRequest._(
      businessName: businessName,
      businessType: businessType,
      gstNo: gstNo,
      address: address,
      pincode: pincode,
      name: name,
      mobile: mobile,
      state: state,
      city: city,
      regionId: regionId,
      areaId: areaId,
      appPk: appPk,
      id: null, 
      userId: userId,
      bankAccountId: bankAccountId,
      type: type,
      brandIds: brandIds,
      imagePath: imagePath,
    );
  }

  factory AddDistributorRequest.update({
    required String id, 
    required String businessName,
    required String businessType,
    required String gstNo,
    required String address,
    required String pincode,
    required String name,
    required String mobile,
    required String state,
    required String city,
    required String regionId,
    required String areaId,
    required String appPk,
    required String userId,
    required String bankAccountId,
    required String type,
    required String brandIds,
    String? imagePath,
  }) {
    return AddDistributorRequest._(
      id: id, 
      businessName: businessName,
      businessType: businessType,
      gstNo: gstNo,
      address: address,
      pincode: pincode,
      name: name,
      mobile: mobile,
      state: state,
      city: city,
      regionId: regionId,
      areaId: areaId,
      appPk: appPk,
      userId: userId,
      bankAccountId: bankAccountId,
      type: type,
      brandIds: brandIds,
      imagePath: imagePath,
    );
  }

  Map<String, String> toFormData() {
    final data = {
      'business_name': businessName,
      'business_type': businessType,
      'gst_no': gstNo,
      'address': address,
      'pincode': pincode,
      'name': name,
      'mobile': mobile,
      'state': state,
      'city': city,
      'region_id': regionId,
      'area_id': areaId,
      'app_pk': appPk,
      'user_id': userId,
      'bank_account_id': bankAccountId,
      'type': type,
      'brand_ids': brandIds,
    };

    
    if (id != null && id!.isNotEmpty) {
      data['id'] = id!;
    }

    return data;
  }
}
