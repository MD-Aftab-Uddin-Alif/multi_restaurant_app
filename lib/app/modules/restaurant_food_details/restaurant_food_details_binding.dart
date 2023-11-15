import 'package:get/get.dart';

import 'restaurant_food_details_controller.dart';

class RestaurantFoodDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantFoodDetailsController>(
      () => RestaurantFoodDetailsController(),
    );
  }
}
