import 'package:multi_restaurant_app/app/modules/category/category_controller.dart';
import 'package:multi_restaurant_app/app/modules/restaurant_food/restaurant_food_controller.dart';
import 'package:multi_restaurant_app/app/modules/view_all_restaurant_food/view_all_restaurant_food_controller.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => RestaurantFoodController());
    Get.lazyPut(() => ViewAllRestaurantFoodController);
    Get.put(() => HomeController(), permanent: true);
  }
}
