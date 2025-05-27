import 'package:get/get.dart';
import '../screens/add_distributor_screen.dart';
import '../screens/distributor_list_screen.dart';

class AppRoutes {
  static const String addDistributor = '/add-distributor';
  static const String distributorList = '/distributor-list';

  static final routes = [
    GetPage(
      name: addDistributor,
      page: () => const AddDistributorScreen(),
    ),
    GetPage(
      name: distributorList,
      page: () => const DistributorListScreen(),
    ),
  ];
}