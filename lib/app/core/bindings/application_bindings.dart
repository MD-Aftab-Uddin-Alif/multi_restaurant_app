import 'package:multi_restaurant_app/package_routes.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
