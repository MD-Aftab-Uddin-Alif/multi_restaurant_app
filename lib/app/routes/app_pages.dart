import 'package:multi_restaurant_app/package_routes.dart';
import 'more_routes.dart';
import 'restaurant_food_routes.dart';


class AppPages {
  AppPages._();

  static const initial = '/home';

  static final routes = [
    ...HomeRoutes.routes,
    ...CategoryRoutes.routes,
		...MoreRoutes.routes,
		...RestaurantFoodRoutes.routes,
  ];
}
