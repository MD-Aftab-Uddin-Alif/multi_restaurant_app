import 'package:multi_restaurant_app/app/core/widgets/restaurant_food_container_widget.dart';
import 'package:multi_restaurant_app/app/routes/restaurant_food_details_routes.dart';
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
        iconTheme: const IconThemeData(color: AppTheme.bText),
        title: const Text(
          'All Food',
          style: TextStyle(color: AppTheme.bIcon),
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
          itemCount: homeCtrl.restaurantFoodList.length,
          itemBuilder: (BuildContext context, int index) {
            return RestaurantFoodContainerWidget(
              restaurantFood: homeCtrl.restaurantFoodList[index],
              route: RestaurantFoodDetailsRoutes.restaurantFoodDetails,
            );
          },
        ),
      ),
    );
  }
}
