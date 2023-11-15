import 'package:multi_restaurant_app/app/core/widgets/restaurant_food_container_widget.dart';
import 'package:multi_restaurant_app/app/modules/restaurant_food/restaurant_food_controller.dart';
import 'package:multi_restaurant_app/app/routes/more_routes.dart';
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
        title: Text(restaurantFoodCtrl.restaurant.name),
        centerTitle: true,
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 170,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: restaurantFoodCtrl.specificRestaurantFoodListLength.value,
          itemBuilder: (BuildContext context, int index) {
            return RestaurantFoodContainerWidget(
              restaurantFood:
                  restaurantFoodCtrl.specificRestaurantFoodList[index],
              route: MoreRoutes.more,
            );
          },
        ),
      ),
    );
  }
}
