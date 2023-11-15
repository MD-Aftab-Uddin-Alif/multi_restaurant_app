import 'package:get/get.dart';

import '../modules/restaurant_food_details/restaurant_food_details_binding.dart';
import '../modules/restaurant_food_details/restaurant_food_details_page.dart';

class RestaurantFoodDetailsRoutes {
  RestaurantFoodDetailsRoutes._();

  static const restaurantFoodDetails = '/restaurant-food-details';

  static final routes = [
    GetPage(
      name: restaurantFoodDetails,
      page: () => const RestaurantFoodDetailsPage(),
      binding: RestaurantFoodDetailsBinding(),
    ),
  ];
}
