import 'package:multi_restaurant_app/package_routes.dart';

class AppPages {
  AppPages._();

  static const initial = '/home';

  static final routes = [
    ...HomeRoutes.routes,
  ];
}
