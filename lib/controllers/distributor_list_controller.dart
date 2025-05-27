import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/distributor_model.dart';
import '../services/api_service.dart';


class DistributorListController extends GetxController {
  var distributors = <DistributorModel>[].obs;
  var isLoading = false.obs;
  var searchQuery = ''.obs;
  var filterType = 'Distributor'.obs;

  final ApiService apiService = ApiService();
  final TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    fetchDistributors();
    super.onInit();
  }

  void updateFilterType(String? value) {
    filterType.value = value ?? 'Distributor';
    fetchDistributors();
  }
 

  void refreshList() {
    searchQuery.value = '';
    searchTextController.clear(); 
    fetchDistributors();
  }

  Future<void> fetchDistributors() async {
    try {
      isLoading.value = true;
      final result = await apiService.getDistributors(filterType.value);
      distributors.assignAll(result);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch distributors: $e');
    } finally {
      isLoading.value = false;
    }
  }
List<DistributorModel> get filteredDistributors {
  if (searchQuery.value.isEmpty) return distributors;
  final query = searchQuery.value.toLowerCase();

  return distributors.where((d) =>
    (d.businessName ?? '').toLowerCase().contains(query) ||
    (d.address ?? '').toLowerCase().contains(query) ||
    (d.status ?? '').toLowerCase().contains(query)
  ).toList();
}

}
