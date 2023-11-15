import 'package:multi_restaurant_app/app/data/models/restaurant_food_model.dart';
import 'package:multi_restaurant_app/app/modules/restaurant_food/restaurant_food_controller.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class HomeController extends GetxController {
  CategoryController categoryController = Get.put(CategoryController());
  RestaurantFoodController restaurantFoodController =
      Get.put(RestaurantFoodController());

  RxList<RestaurantModel> restaurantList = <RestaurantModel>[].obs;
  RxList<RestaurantFoodModel> restaurantFoodList = <RestaurantFoodModel>[].obs;
  void init() {
    try {
      categoryController.fetchRestaurantList();
    } catch (e) {
      print('${e.toString()} in Splash Screen Controller init');
    }
  }
}
