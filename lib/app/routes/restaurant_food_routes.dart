import 'package:get/get.dart';

import '../modules/restaurant_food/restaurant_food_binding.dart';
import '../modules/restaurant_food/restaurant_food_page.dart';

class RestaurantFoodRoutes {
  RestaurantFoodRoutes._();

  static const restaurantFood = '/restaurant-food';

  static final routes = [
    GetPage(
      name: restaurantFood,
      page: () => const RestaurantFoodPage(),
      binding: RestaurantFoodBinding(),
    ),
  ];
}
