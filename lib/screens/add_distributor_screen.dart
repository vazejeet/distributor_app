import 'dart:io';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("select type",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.updateType('Distributor'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              controller.type.value == 'Distributor'
                                  ? Colors.black
                                  : Colors.grey[300],
                          foregroundColor:
                              controller.type.value == 'Distributor'
                                  ? Colors.white
                                  : Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('DISTRIBUTOR'),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.updateType('Retailer'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.type.value == 'Retailer'
                              ? Colors.black
                              : Colors.grey[300],
                          foregroundColor: controller.type.value == 'Retailer'
                              ? Colors.white
                              : Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text('RETAILER'),
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Obx(() => GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: controller.pickedImage.value == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.camera_alt,
                                    size: 50, color: Colors.grey),
                                SizedBox(height: 8),
                                Text(
                                  'Take Photo',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(controller.pickedImage.value!.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                    ),
                  )),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Distributor Business Name',
                onChanged: (value) => controller.businessName.value = value,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Business Type',
                onChanged: (value) => controller.businessType.value = value,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          value: controller.state.value,
                          items: ['Select', 'West Bengal', 'Karnataka'],
                          onChanged: controller.updateState,
                          hint: 'Select State',
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: CustomDropdown(
                          value: controller.city.value,
                          items: ['Select', 'Kolkata', 'Bangalore'],
                          onChanged: controller.updateCity,
                          hint: 'Select City',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              Obx(() => Row(
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          value: controller.region.value,
                          items: ['Select', 'Region 1', 'Region 2'],
                          onChanged: controller.updateRegion,
                          hint: 'Select Region',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomDropdown(
                          value: controller.area.value,
                          items: ['Select', 'Area 1', 'Area 2'],
                          onChanged: controller.updateArea,
                          hint: 'Select Area',
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Address',
                onChanged: (value) => controller.address.value = value,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'GST No.',
                onChanged: (value) => controller.gstNo.value = value,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
           
              CustomTextField(
                label: 'Bank Account ID',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  
                  if (RegExp(r'^\d*$').hasMatch(value)) {
                    controller.bankid.value = value;
                  }
                },
              ),

              SizedBox(height: 16),
              CustomTextField(
                label: 'Pin Code',
                onChanged: (value) => controller.pincode.value = value,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Person Name',
                onChanged: (value) => controller.personName.value = value,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextField(
                label: 'Mobile',
                onChanged: (value) => controller.mobile.value = value,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              Obx(() => CustomDropdown(
                    value: controller.brandIds.value,
                    items: ['21,22', '23,24'],
                    onChanged: (value) =>
                        controller.brandIds.value = value ?? '21,22',
                    hint: 'Select Brand',
                  )),
              SizedBox(height: 26),
              GestureDetector(
                onTap: controller.submit,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
