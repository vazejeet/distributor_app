import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_distributor_controller.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_text_field.dart';

class AddDistributorScreen extends StatelessWidget {
  const AddDistributorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddDistributorController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Distributor/Retailer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => CustomDropdown(
                    value: controller.type.value,
                    items: ['Distributor', 'Retailer'],
                    onChanged: controller.updateType,
                    hint: 'Select Type',
                  )),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Distributor Business Name',
                onChanged: (value) => controller.businessName.value = value,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Business Type',
                onChanged: (value) => controller.businessType.value = value,
              ),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.state.value,
                    items: ['Select', 'West Bengal', 'Karnataka'],
                    onChanged: controller.updateState,
                    hint: 'Select State',
                  )),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.region.value,
                    items: ['Select', 'Region 1', 'Region 2'],
                    onChanged: controller.updateRegion,
                    hint: 'Select Region',
                  )),
              SizedBox(height: 16),
              Obx(() => CustomDropdown( 
                    value: controller.city.value,
                    items: ['Select', 'Kolkata', 'Bangalore'],
                    onChanged: controller.updateCity,
                    hint: 'Select City',
                  )),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.area.value,
                    items: ['Select', 'Area 1', 'Area 2'],
                    onChanged: controller.updateArea,
                    hint: 'Select Area',
                  )),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Address',
                onChanged: (value) => controller.address.value = value,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'GST No.',
                onChanged: (value) => controller.gstNo.value = value,
              ),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.bankName.value,
                    items: ['Select', 'Bank 1', 'Bank 2'],
                    onChanged: controller.updateBankName,
                    hint: 'Select Bank Name',
                  )),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Pin Code',
                onChanged: (value) => controller.pincode.value = value,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Person Name',
                onChanged: (value) => controller.personName.value = value,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Mobile',
                onChanged: (value) => controller.mobile.value = value,
              ),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.brandIds.value,
                    items: ['21,22', '23,24'],
                    onChanged: (value) => controller.brandIds.value = value ?? '21,22',
                    hint: 'Select Brand',
                  )),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.pickImage,
                child: Text('Take Photo'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.submit,
                child: Text('SUBMIT'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}