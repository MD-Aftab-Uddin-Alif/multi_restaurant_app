import 'package:multi_restaurant_app/package_routes.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
