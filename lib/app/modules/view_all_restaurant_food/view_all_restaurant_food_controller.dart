import 'package:multi_restaurant_app/app/data/models/restaurant_food_model.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class ViewAllRestaurantFoodController extends GetxController {
  bool printRestaurantFood = false; // ? this is for debugging purpose
  dynamic lastFetchedData;
  RxBool isRestaurantFoodLoading = false.obs;

  void fetchRestaurantFoodList() {
    try {
      isRestaurantFoodLoading.value = true;
      HomeController homeCtrl = Get.find();
      homeCtrl.restaurantFoodList.clear();
      fetchListDataProvider(
        functionName: 'fetchRestaurantFoodList',
        listFor: 'Restaurant Food',
        apiUrl: ApiUrl.getRestaurantFoodList,
        dataCallback: (data) {
          try {
            data.forEach((item) {
              lastFetchedData = item;
              homeCtrl.restaurantFoodList
                  .add(RestaurantFoodModel.fromJson(item));
            });
            DP.status('Restaurant Food Data Stored', 'fetchRestaurantFoodList',
                forcePrint: printRestaurantFood);
          } catch (e) {
            DP.error(
                'Something went Wrong while storing Restaurant Food data, ${lastFetchedData.toString()}',
                'fetchRestaurantFoodList');
          }
        },
        forcePrint: printRestaurantFood,
      );
    } catch (e) {
      DP.fatal(
          'Something went Wrong while fetching Restaurant Food List, ${e.toString()}',
          'fetchRestaurantFoodList');
    } finally {
      isRestaurantFoodLoading.value = false;
    }
  }
}
