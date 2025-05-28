import 'dart:io';
import 'package:distributor_app/models/add_distributor_request.dart';
import 'package:distributor_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/distributor_model.dart';

class DistributorDetailScreen extends StatelessWidget {
  final DistributorModel distributor;

  const DistributorDetailScreen({super.key, required this.distributor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(distributor.businessName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showUpdateDialog(context),
        icon: const Icon(Icons.edit,color: Colors.white,),
        label: const Text('Update', style: TextStyle(fontSize: 16,color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (distributor.img?.isNotEmpty == true)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  distributor.img!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 20),

          
            _buildDetailCard(
              title: 'Basic Details',
              children: [
                _buildDetailRow('Business Name', distributor.businessName),
                _buildDetailRow('GST No', distributor.gstNo),
                _buildDetailRow('Mobile', distributor.mobile),
                _buildDetailRow('Type', distributor.type),
                _buildDetailRow('Business Type', distributor.businessType),
                _buildDetailRow('Status', distributor.status),
              ],
            ),

            const SizedBox(height: 16),

           
            _buildDetailCard(
              title: 'Address Details',
              children: [
                _buildDetailRow('Address', distributor.address),
                _buildDetailRow('City', distributor.city),
                _buildDetailRow('State', distributor.state),
                _buildDetailRow('Pincode', distributor.pincode),
                _buildDetailRow('Region ID', distributor.regionId),
                _buildDetailRow('Area ID', distributor.areaId),
              ],
            ),

            const SizedBox(height: 16),

          
            _buildDetailCard(
              title: 'Other Details',
              children: [
                _buildDetailRow('ID', distributor.id),
                _buildDetailRow('App PK', distributor.appPk),
                _buildDetailRow('Bank Account ID', distributor.bankAccountId),
                _buildDetailRow('User ID', distributor.userId),
                _buildDetailRow('Brands', distributor.brands),
                _buildDetailRow('Open Time', distributor.openTime),
                _buildDetailRow('Close Time', distributor.closeTime),
                _buildDetailRow('Parent ID', distributor.parentId),
                _buildDetailRow('Is Async', distributor.isAsync),
                _buildDetailRow('Is Delete', distributor.isDelete),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            const Divider(height: 20, thickness: 2),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  void showUpdateDialog(BuildContext context) {
    final businessNameController =
        TextEditingController(text: distributor.businessName);
    final gstController = TextEditingController(text: distributor.gstNo);
    final idController = TextEditingController(text: distributor.id);
    final mobileController = TextEditingController(text: distributor.mobile);
    final addressController = TextEditingController(text: distributor.address);
    final businessTypeController =
        TextEditingController(text: distributor.businessType);
    final typeController = TextEditingController(text: distributor.type);
    final cityController = TextEditingController(text: distributor.city);
    final stateController = TextEditingController(text: distributor.state);
    final pincodeController = TextEditingController(text: distributor.pincode);
    final regionIdController = TextEditingController(text: distributor.regionId);
    final areaIdController = TextEditingController(text: distributor.areaId);
    final appPkController = TextEditingController(text: distributor.appPk);
    final bankAccountIdController =
        TextEditingController(text: distributor.bankAccountId);
    final userIdController = TextEditingController(text: distributor.userId);
    final brandsController = TextEditingController(text: distributor.brands);
    final openTimeController = TextEditingController(text: distributor.openTime);
    final closeTimeController = TextEditingController(text: distributor.closeTime);
    final parentIdController = TextEditingController(text: distributor.parentId);
    final isAsyncController = TextEditingController(text: distributor.isAsync);
    final isDeleteController = TextEditingController(text: distributor.isDelete);
    final statusController = TextEditingController(text: distributor.status);

    RxString imagePath = ''.obs;

    Get.dialog(
      AlertDialog(
        title: const Text('Update Distributor'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => imagePath.value.isNotEmpty
                    ? Image.file(File(imagePath.value), height: 150)
                    : distributor.img?.isNotEmpty == true
                        ? Image.network(distributor.img!, height: 150)
                        : const SizedBox()),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Change Image'),
                  onPressed: () async {
                    final picker = ImagePicker();
                    final picked =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (picked != null) imagePath.value = picked.path;
                  },
                ),
                const SizedBox(height: 16),

               
                _buildUpdateSection('Basic Details', [
                  _buildTextField(businessNameController, 'Business Name'),
                  _buildTextField(businessTypeController, 'Business Type'),
                  _buildTextField(gstController, 'GST No'),
                  _buildTextField(mobileController, 'Mobile'),
                  _buildTextField(typeController, 'Type'),
                  _buildTextField(statusController, 'Status'),
                ]),

                const SizedBox(height: 16),

                _buildUpdateSection('Address Details', [
                  _buildTextField(addressController, 'Address'),
                  _buildTextField(cityController, 'City'),
                  _buildTextField(stateController, 'State'),
                  _buildTextField(pincodeController, 'Pincode'),
                  _buildTextField(regionIdController, 'Region ID'),
                  _buildTextField(areaIdController, 'Area ID'),
                ]),

                const SizedBox(height: 16),

                _buildUpdateSection('Other Details', [
                  _buildTextField(idController, 'ID', enabled: false),
                  _buildTextField(appPkController, 'App PK'),
                  _buildTextField(bankAccountIdController, 'Bank Account ID'),
                  _buildTextField(userIdController, 'User ID',enabled: false),
                  _buildTextField(brandsController, 'Brands'),
                  _buildTextField(openTimeController, 'Open Time',enabled: false),
                  _buildTextField(closeTimeController, 'Close Time',enabled: false),
                  _buildTextField(parentIdController, 'Parent ID',enabled: false),
                  _buildTextField(isAsyncController, 'Is Async',enabled: false),
                  _buildTextField(isDeleteController, 'Is Delete',enabled: false),
                ]),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
              ElevatedButton.icon(
            onPressed: () async {
              final request = AddDistributorRequest.update(
                businessName: businessNameController.text,
                businessType: businessTypeController.text,
                gstNo: gstController.text,
                address: addressController.text,
                pincode: pincodeController.text,
                name: distributor.name ?? '',
                mobile: mobileController.text,
                state: stateController.text,
                city: cityController.text,
                regionId: regionIdController.text,
                areaId: areaIdController.text,
                appPk: appPkController.text,
                id: idController.text,
                userId: userIdController.text,
                bankAccountId: bankAccountIdController.text,
                type: typeController.text,
                brandIds: brandsController.text,
                imagePath: imagePath.value.isNotEmpty ? imagePath.value : null,
              );

              try {
                await ApiService().addDistributor(request);
                Get.back(); 
                Get.snackbar('Success', 'Distributor updated successfully');
                Get.offAllNamed('/distributor_list'); 
              } catch (e) {
                Get.snackbar('Error', 'Update failed: $e');
              }
            },
         
             icon: const Icon(Icons.check_circle_outline,color: Colors.white),
        label: const Text('Submit', style: TextStyle(fontSize: 16,color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
        
        ],
      ),
    );
  }

  Widget _buildUpdateSection(String title, List<Widget> fields) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(height: 8),
        ...fields,
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
