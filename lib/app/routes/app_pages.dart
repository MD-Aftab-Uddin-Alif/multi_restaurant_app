import 'package:multi_restaurant_app/package_routes.dart';
import 'more_routes.dart';
import 'restaurant_food_routes.dart';
import 'view_all_restaurant_food_routes.dart';
import 'restaurant_food_details_routes.dart';


class AppPages {
  AppPages._();

  static const initial = '/home';

  static final routes = [
    ...HomeRoutes.routes,
    ...CategoryRoutes.routes,
		...MoreRoutes.routes,
		...RestaurantFoodRoutes.routes,
		...ViewAllRestaurantFoodRoutes.routes,
		...RestaurantFoodDetailsRoutes.routes,
  ];
}
