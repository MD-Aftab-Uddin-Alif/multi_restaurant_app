import 'package:get/get.dart';

import '../modules/view_all_restaurant_food/view_all_restaurant_food_binding.dart';
import '../modules/view_all_restaurant_food/view_all_restaurant_food_page.dart';

class ViewAllRestaurantFoodRoutes {
  ViewAllRestaurantFoodRoutes._();

  static const viewAllRestaurantFood = '/view-all-restaurant-food';

  static final routes = [
    GetPage(
      name: viewAllRestaurantFood,
      page: () => const ViewAllRestaurantFoodPage(),
      binding: ViewAllRestaurantFoodBinding(),
    ),
  ];
}
