import 'package:get/get.dart';
import 'package:multi_restaurant_app/app/modules/home/home_controller.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
