import 'package:multi_restaurant_app/app/core/widgets/restaurant_food_container_widget.dart';
import 'package:multi_restaurant_app/app/modules/restaurant_food/restaurant_food_controller.dart';
import 'package:multi_restaurant_app/app/routes/restaurant_food_details_routes.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class RestaurantFoodPage extends StatefulWidget {
  const RestaurantFoodPage({super.key});

  @override
  State<RestaurantFoodPage> createState() => _RestaurantFoodPageState();
}

class _RestaurantFoodPageState extends State<RestaurantFoodPage> {
  HomeController homeCtrl = Get.find();
  RestaurantFoodController restaurantFoodCtrl = Get.find();

  @override
  void initState() {
    restaurantFoodCtrl.restaurant = Get.arguments;
    restaurantFoodCtrl.getSpecificRestaurantFoodList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppTheme.bText),
        title: Text(
          restaurantFoodCtrl.restaurant.name,
          style: const TextStyle(color: AppTheme.bIcon),
        ),
        centerTitle: true,
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSize.pTen),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 230,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: restaurantFoodCtrl.specificRestaurantFoodListLength.value,
          itemBuilder: (BuildContext context, int index) {
            return RestaurantFoodContainerWidget(
              restaurantFood:
                  restaurantFoodCtrl.specificRestaurantFoodList[index],
              route: RestaurantFoodDetailsRoutes.restaurantFoodDetails,
            );
          },
        ),
      ),
    );
  }
}
