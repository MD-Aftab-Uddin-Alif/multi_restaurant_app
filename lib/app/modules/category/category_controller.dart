import 'package:multi_restaurant_app/package_routes.dart';

class CategoryController extends GetxController {
  bool printRestaurant = true; // ? this is for debugging purpose
  dynamic lastFetchedData;
  RxBool isCategoryLoading = false.obs;

  void fetchRestaurantList() {
    try {
      isCategoryLoading.value = true;
      HomeController homeCtrl = Get.find();
      homeCtrl.restaurantList.clear();
      fetchListDataProvider(
        functionName: 'fetchRestaurantList',
        listFor: 'Restaurant',
        apiUrl: ApiUrl.getRestaurantList,
        dataCallback: (data) {
          try {
            data.forEach((item) {
              lastFetchedData = item;
              homeCtrl.restaurantList.add(RestaurantModel.fromJson(item));
            });
            DP.status('Restaurant Data Stored', 'fetchRestaurantList',
                forcePrint: printRestaurant);
          } catch (e) {
            DP.error(
                'Something went Wrong while storing Restaurant data, ${lastFetchedData.toString()}',
                'fetchRestaurantList');
          }
        },
        forcePrint: printRestaurant,
      );
    } catch (e) {
      DP.fatal(
          'Something went Wrong while fetching Restaurant List, ${e.toString()}',
          'fetchRestaurantList');
    } finally {
      isCategoryLoading.value = false;
    }
  }
}
