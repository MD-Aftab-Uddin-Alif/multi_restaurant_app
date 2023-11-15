import 'package:multi_restaurant_app/app/data/models/restaurant_food_model.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class RestaurantFoodController extends GetxController {
  RxBool isRestaurantFoodLoading = false.obs;
  late RestaurantModel restaurant;

  RxList<RestaurantFoodModel> specificRestaurantFoodList =
      <RestaurantFoodModel>[].obs;
  RxInt specificRestaurantFoodListLength = 0.obs;

  void getSpecificRestaurantFoodList() {
    try {
      specificRestaurantFoodList.clear();
      HomeController homeCtrl = Get.find();
      for (var element in homeCtrl.restaurantFoodList) {
        if (element.rId == restaurant.rId) {
          specificRestaurantFoodList.add(element);
        }
        specificRestaurantFoodListLength.value =
            specificRestaurantFoodList.length;
      }
    } catch (e) {
      dPrint('${e.toString()} in getSpecificRestaurantFoodList');
    }
  }
}
