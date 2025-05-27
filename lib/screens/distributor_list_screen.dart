import 'package:distributor_app/screens/distributor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/distributor_list_controller.dart';
import '../widgets/custom_dropdown.dart';

class DistributorListScreen extends StatelessWidget {
  const DistributorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DistributorListController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Distributor/Retailer List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh List',
            onPressed: controller.refreshList,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchTextController,
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Obx(() => CustomDropdown(
                        value: controller.filterType.value,
                        items: ['Distributor', 'Retailer'],
                        onChanged: controller.updateFilterType,
                        hint: 'Select Type',
                      )),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => Get.toNamed('/add-distributor'),
                  child: Text('Add New'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              final filteredList = controller.filteredDistributors;

              return Expanded(
                child: filteredList.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final distributor = filteredList[index];
                          return Card(
                            child: ListTile(
                              onTap: () {
                                Get.to(() => DistributorDetailScreen(
                                    distributor: distributor));
                              },
                              title: Text(distributor.businessName),
                              subtitle: Text(
                                  '${distributor.address}\nStatus: ${distributor.status}'),
                            ),
                          );
                        },
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
