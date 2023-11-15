import 'package:get/get.dart';

import 'view_all_restaurant_food_controller.dart';

class ViewAllRestaurantFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllRestaurantFoodController>(
      () => ViewAllRestaurantFoodController(),
    );
  }
}
