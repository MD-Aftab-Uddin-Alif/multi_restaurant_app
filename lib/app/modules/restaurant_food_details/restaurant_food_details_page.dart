import 'package:multi_restaurant_app/app/modules/restaurant_food_details/restaurant_food_details_controller.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class RestaurantFoodDetailsPage extends StatefulWidget {
  const RestaurantFoodDetailsPage({super.key});

  @override
  State<RestaurantFoodDetailsPage> createState() =>
      _RestaurantFoodDetailsPageState();
}

class _RestaurantFoodDetailsPageState extends State<RestaurantFoodDetailsPage> {
  HomeController homeCtrl = Get.find();
  RestaurantFoodDetailsController restaurantFoodDetailsCtrl = Get.find();

  @override
  void initState() {
    restaurantFoodDetailsCtrl.restaurantFood = Get.arguments;
    super.initState();
  }

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
    //required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        //onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: AppTheme.bText,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add To Favorite",
            iconData: Icons.favorite_outline,
            // onTap: (){

            // }
          ),
          bottomNavigatorBar(
            backgroundColor: AppTheme.secondaryColor,
            color: Colors.black,
            iconColor: Colors.white,
            title: "Add To Cart",
            iconData: Icons.shopping_cart_outlined,
            // onTap: (){

            // }
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: AppTheme.secondaryColor,
        iconTheme: const IconThemeData(color: AppTheme.bText),
        title: const Text(
          "Food overview",
          style: TextStyle(color: AppTheme.bText),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ListTile(
                  subtitle: Text(
                    restaurantFoodDetailsCtrl.restaurantFood.name,
                    style: const TextStyle(
                      color: AppTheme.bText,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: ApiUrl.baseURL +
                        restaurantFoodDetailsCtrl.restaurantFood.image,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Available Options: ${restaurantFoodDetailsCtrl.restaurantFood.stock}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: AppTheme.bText,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  const Text(
                    "About This Product",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    restaurantFoodDetailsCtrl.restaurantFood.details,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppTheme.bText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
