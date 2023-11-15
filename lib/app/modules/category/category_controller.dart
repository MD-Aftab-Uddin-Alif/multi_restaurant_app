import 'package:multi_restaurant_app/app/data/models/banner_model.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class CategoryController extends GetxController {
  bool printRestaurant = false; // ? this is for debugging purpose
  dynamic lastFetchedData;
  RxBool isCategoryLoading = false.obs;

  bool printBanner = false; // ? this is for debugging purpose
  RxBool isBannerLoading = false.obs;

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

  void fetchBannerList() {
    try {
      isBannerLoading.value = true;
      HomeController homeCtrl = Get.find();
      homeCtrl.bannerList.clear();
      fetchListDataProvider(
        functionName: 'fetchBannerList',
        listFor: 'Banner',
        apiUrl: ApiUrl.getBannerList,
        dataCallback: (data) {
          try {
            data.forEach((item) {
              lastFetchedData = item;
              homeCtrl.bannerList.add(BannerModel.fromJson(item));
            });
            DP.status('Banner Data Stored', 'fetchBannerList',
                forcePrint: printBanner);
          } catch (e) {
            DP.error(
                'Something went Wrong while storing Banner data, ${lastFetchedData.toString()}',
                'fetchBannerList');
          }
        },
        forcePrint: printBanner,
      );
    } catch (e) {
      DP.fatal(
          'Something went Wrong while fetching Restaurant List, ${e.toString()}',
          'fetchBannerList');
    } finally {
      isBannerLoading.value = false;
    }
  }
}
