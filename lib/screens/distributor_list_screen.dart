import 'package:distributor_app/screens/add_distributor_screen.dart';
import 'package:distributor_app/screens/distributor_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/distributor_list_controller.dart';

class DistributorListScreen extends StatelessWidget {
  const DistributorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DistributorListController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                'DISTRIBUTOR/RETAILER LIST',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
 
            
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.black),
            tooltip: 'Refresh List',
            onPressed: controller.refreshList,
          ),
        ],
        elevation: 0,
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() => ElevatedButton(
                      onPressed: () =>
                          controller.updateFilterType('Distributor'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.filterType.value == 'Distributor'
                                ? Colors.black
                                : Colors.grey[300],
                        foregroundColor:
                            controller.filterType.value == 'Distributor'
                                ? Colors.white
                                : Colors.black,
                      ),
                      child: Text('DISTRIBUTOR'),
                    )),
                Obx(() => ElevatedButton(
                      onPressed: () => controller.updateFilterType('Retailer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.filterType.value == 'Retailer'
                                ? Colors.black
                                : Colors.grey[300],
                        foregroundColor:
                            controller.filterType.value == 'Retailer'
                                ? Colors.white
                                : Colors.black,
                      ),
                      child: Text('RETAILER'),
                    )),
              ],
            ),
            SizedBox(height: 16),
            Obx(() {
              if (controller.isLoading.value) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }

              final filteredList = controller.filteredDistributors;

              return Expanded(
                child: filteredList.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.separated(
                        itemCount: filteredList.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final distributor = filteredList[index];
                          return Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              onTap: () {
                                Get.to(() => DistributorDetailScreen(
                                    distributor: distributor));
                              },
                              leading:
                                  Icon(Icons.location_on, color: Colors.black),
                              title: Text(
                                distributor.businessName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(distributor.address ?? 'No address'),
                                  SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Status: ',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: distributor.status ?? 'N/A',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              trailing:
                                  Icon(Icons.more_vert, color: Colors.black),
                            ),
                          );
                        },
                      ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddDistributorScreen(),
              arguments: controller.filterType.value);
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
