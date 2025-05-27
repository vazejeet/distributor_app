import 'dart:io';

import 'package:distributor_app/models/add_distributor_request.dart';
import 'package:distributor_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../models/distributor_model.dart';

// class DistributorDetailScreen extends StatelessWidget {
//   final DistributorModel distributor;

//   const DistributorDetailScreen({super.key, required this.distributor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(distributor.businessName),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (distributor.img != null && distributor.img!.isNotEmpty)
//               Center(
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: Image.network(
//                     distributor.img!,
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => const Icon(
//                       Icons.broken_image,
//                       size: 100,
//                       color: Colors.grey,
//                     ),
//                     loadingBuilder: (context, child, loadingProgress) {
//                       if (loadingProgress == null) return child;
//                       return const Center(child: CircularProgressIndicator());
//                     },
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 16),
//             _buildDetailCard('ID', distributor.id),
//             _buildDetailCard('Type', distributor.type),
//             _buildDetailCard('Business Name', distributor.businessName),
//             _buildDetailCard('Business Type', distributor.businessType),
//             _buildDetailCard('GST Number', distributor.gstNo),
//             _buildDetailCard('Address', distributor.address),
//             _buildDetailCard('Pincode', distributor.pincode),
//             _buildDetailCard('Contact Name', distributor.name),
//             _buildDetailCard('Mobile', distributor.mobile),
//             _buildDetailCard('State', distributor.state),
//             _buildDetailCard('City', distributor.city),
//             _buildDetailCard('Region ID', distributor.regionId),
//             _buildDetailCard('Area ID', distributor.areaId),
//             _buildDetailCard('App PK', distributor.appPk),
//             _buildDetailCard('Bank Account ID', distributor.bankAccountId),
//             _buildDetailCard('Status', distributor.status),
//             _buildDetailCard('Open Time', distributor.openTime),
//             _buildDetailCard('Close Time', distributor.closeTime),
//             _buildDetailCard('Parent ID', distributor.parentId),
//             _buildDetailCard('Is Async', distributor.isAsync),
//             _buildDetailCard('Brands', distributor.brands),
//             _buildDetailCard('Is Deleted', distributor.isDelete),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailCard(String label, String? value) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.only(bottom: 12.0),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               label,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               value ?? 'N/A',
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black54,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// class DistributorDetailScreen extends StatelessWidget {
//   final DistributorModel distributor;

//   const DistributorDetailScreen({super.key, required this.distributor});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(distributor.businessName),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           // ✅ Navigate to update form with distributor data
//           Get.toNamed('/add-distributor', arguments: distributor);
//         },
//         icon: const Icon(Icons.edit),
//         label: const Text('Update'),
//         backgroundColor: Colors.indigo,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             if (distributor.img != null && distributor.img!.isNotEmpty)
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   distributor.img!,
//                   height: 220,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) =>
//                       const Icon(Icons.broken_image, size: 100),
//                   loadingBuilder: (context, child, loadingProgress) =>
//                       loadingProgress == null
//                           ? child
//                           : const Center(child: CircularProgressIndicator()),
//                 ),
//               ),
//             const SizedBox(height: 20),
//             _buildGridDetail('ID', distributor.id),
//             _buildGridDetail('Type', distributor.type),
//             _buildGridDetail('Business Name', distributor.businessName),
//             _buildGridDetail('Business Type', distributor.businessType),
//             _buildGridDetail('GST No', distributor.gstNo),
//             _buildGridDetail('Address', distributor.address),
//             _buildGridDetail('Pincode', distributor.pincode),
//             _buildGridDetail('Contact Name', distributor.name),
//             _buildGridDetail('Mobile', distributor.mobile),
//             _buildGridDetail('State', distributor.state),
//             _buildGridDetail('City', distributor.city),
//             _buildGridDetail('Region ID', distributor.regionId),
//             _buildGridDetail('Area ID', distributor.areaId),
//             _buildGridDetail('App PK', distributor.appPk),
//             _buildGridDetail('Bank Account ID', distributor.bankAccountId),
//             _buildGridDetail('Status', distributor.status),
//             _buildGridDetail('Open Time', distributor.openTime),
//             _buildGridDetail('Close Time', distributor.closeTime),
//             _buildGridDetail('Parent ID', distributor.parentId),
//             _buildGridDetail('Is Async', distributor.isAsync),
//             _buildGridDetail('Brands', distributor.brands),
//             _buildGridDetail('Is Deleted', distributor.isDelete),
//             const SizedBox(height: 100), // space for FAB
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildGridDetail(String title, String? value) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//           ),
//         ),
//         subtitle: Text(
//           value?.isNotEmpty == true ? value! : 'N/A',
//           style: const TextStyle(
//             color: Colors.black54,
//             fontSize: 15,
//           ),
//         ),
//         leading: const Icon(Icons.info_outline, color: Colors.indigo),
//       ),
//     );
//   }
// }




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
        icon: const Icon(Icons.edit),
        label: const Text('Update'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            _buildGridDetail('Business Name', distributor.businessName),
            _buildGridDetail('GST No', distributor.gstNo),
            _buildGridDetail('Mobile', distributor.mobile),
            _buildGridDetail('Type', distributor.type),
            _buildGridDetail('Address', distributor.address),
            _buildGridDetail('id', distributor.id),
          ],
        ),
      ),
    );
  }

  Widget _buildGridDetail(String title, String? value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.info_outline),
        title: Text(title),
        subtitle: Text(value ?? 'N/A'),
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

    RxString imagePath = ''.obs;

    Get.dialog(
      AlertDialog(
        title: const Text('Update Distributor'),
        content: SingleChildScrollView(
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
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  if (picked != null) imagePath.value = picked.path;
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: businessNameController,
                decoration: const InputDecoration(labelText: 'Business Name'),
              ),
              TextField(
                controller: gstController,
                decoration: const InputDecoration(labelText: 'GST No'),
              ),
              TextField(
                controller: mobileController,
                decoration: const InputDecoration(labelText: 'Mobile'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
                TextField(
                controller: idController,
                decoration: const InputDecoration(labelText: 'id',enabled: false),
              ),
              
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              print('Updating distributor with ID: ${distributor.id}');
              final request = AddDistributorRequest.update(
                businessName: businessNameController.text,
                businessType: distributor.businessType ?? '',
                gstNo: gstController.text,
                address: addressController.text,
                pincode: distributor.pincode ?? '',
                name: distributor.name ?? '',
                mobile: mobileController.text,
                state: distributor.state ?? '',
                city: distributor.city ?? '',
                regionId: distributor.regionId ?? '1',
                areaId: distributor.areaId ?? '1',
                appPk: distributor.appPk ?? '1',
                id: distributor.id !, 
                userId: distributor.userId ?? '45',
                bankAccountId: distributor.bankAccountId ?? '2',
                type: distributor.type ?? 'Distributor',
                brandIds: distributor.brands ?? '21,22',
                imagePath: imagePath.value.isNotEmpty ? imagePath.value : null,
              );

              try {
                await ApiService().addDistributor(request);
                Get.back(); // close dialog
                Get.snackbar('Success', 'Distributor updated successfully');
              } catch (e) {
                Get.snackbar('Error', 'Update failed: $e');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
