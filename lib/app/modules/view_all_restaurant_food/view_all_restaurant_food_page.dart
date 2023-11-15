import 'package:multi_restaurant_app/app/core/widgets/restaurant_food_container_widget.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class ViewAllRestaurantFoodPage extends StatefulWidget {
  const ViewAllRestaurantFoodPage({super.key});

  @override
  State<ViewAllRestaurantFoodPage> createState() =>
      _ViewAllRestaurantFoodPageState();
}

class _ViewAllRestaurantFoodPageState extends State<ViewAllRestaurantFoodPage> {
  HomeController homeCtrl = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Food'),
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
          itemCount: homeCtrl.restaurantFoodList.length,
          itemBuilder: (BuildContext context, int index) {
            return RestaurantFoodContainerWidget(
              restaurantFood: homeCtrl.restaurantFoodList[index],
              route: 'MoreRoutes.more',
            );
          },
        ),
      ),
    );
  }
}
