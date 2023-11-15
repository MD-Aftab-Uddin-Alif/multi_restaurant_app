import 'package:get/get.dart';

import 'restaurant_food_controller.dart';

class RestaurantFoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantFoodController>(
      () => RestaurantFoodController(),
    );
  }
}
