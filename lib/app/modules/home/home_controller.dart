import 'package:multi_restaurant_app/package_routes.dart';

class HomeController extends GetxController {
  CategoryController categoryController = Get.put(CategoryController());

  RxList<RestaurantModel> restaurantList = <RestaurantModel>[].obs;
  void init() {
    try {
      categoryController.fetchRestaurantList();
    } catch (e) {
      print('${e.toString()} in Splash Screen Controller init');
    }
  }
}
