import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/add_distributor_request.dart';
import '../services/api_service.dart';

class AddDistributorController extends GetxController {
  var businessName = ''.obs;
  var businessType = ''.obs;
  var gstNo = ''.obs;
  var address = ''.obs;
  var pincode = ''.obs;
  var personName = ''.obs;
  var mobile = ''.obs;
  var state = 'Select'.obs;
  var city = 'Select'.obs;
  var region = 'Select'.obs;
  var area = 'Select'.obs;
  var bankName = 'Select'.obs;
  var type = 'Distributor'.obs;
  var brandIds = '21,22'.obs;
  var imagePath = ''.obs;

  final ApiService apiService = ApiService();
  final ImagePicker _picker = ImagePicker();

  void updateType(String? value) => type.value = value ?? 'Distributor';
  void updateState(String? value) => state.value = value ?? 'Select';
  void updateCity(String? value) => city.value = value ?? 'Select';
  void updateRegion(String? value) => region.value = value ?? 'Select';
  void updateArea(String? value) => area.value = value ?? 'Select';
  void updateBankName(String? value) => bankName.value = value ?? 'Select';

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  Future<void> submit() async {
    try {
      final request = AddDistributorRequest.create(
        businessName: businessName.value,
        businessType: businessType.value,
        gstNo: gstNo.value,
        address: address.value,
        pincode: pincode.value,
        name: personName.value,
        mobile: mobile.value,
        state: state.value,
        city: city.value,
        regionId: '1',
        areaId: '1',
        appPk: '1',
        // id: '5356',
        userId: '45',
        bankAccountId: '2',
        type: type.value,
        brandIds: brandIds.value,
        imagePath: imagePath.value.isNotEmpty ? imagePath.value : null,
      );
      await apiService.addDistributor(request);
      Get.snackbar('Success', 'Distributor added successfully');
      Get.offNamed('/distributor-list');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add distributor: $e');
    }
  }
}