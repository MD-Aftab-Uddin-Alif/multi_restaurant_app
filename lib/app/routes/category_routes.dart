import 'package:get/get.dart';

import '../modules/category/category_binding.dart';
import '../modules/category/category_page.dart';

class CategoryRoutes {
  CategoryRoutes._();

  static const category = '/category';

  static final routes = [
    GetPage(
      name: category,
      page: () => const CategoryPage(),
      binding: CategoryBinding(),
    ),
  ];
}
