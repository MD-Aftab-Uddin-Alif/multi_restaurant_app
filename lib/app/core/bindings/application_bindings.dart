import 'package:multi_restaurant_app/app/modules/category/category_controller.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.put(() => HomeController(), permanent: true);
  }
}
