import 'package:multi_restaurant_app/app/data/models/restaurant_food_model.dart';
import 'package:multi_restaurant_app/app/modules/view_all_restaurant_food/view_all_restaurant_food_controller.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class HomeController extends GetxController {
  CategoryController categoryController = Get.put(CategoryController());
  ViewAllRestaurantFoodController viewAllRestaurantFoodController =
      Get.put(ViewAllRestaurantFoodController());

  RxList<RestaurantModel> restaurantList = <RestaurantModel>[].obs;
  RxList<RestaurantFoodModel> restaurantFoodList = <RestaurantFoodModel>[].obs;
  void init() {
    try {
      categoryController.fetchRestaurantList();
      viewAllRestaurantFoodController.fetchRestaurantFoodList();
    } catch (e) {
      print('${e.toString()} in Splash Screen Controller init');
    }
  }
}
