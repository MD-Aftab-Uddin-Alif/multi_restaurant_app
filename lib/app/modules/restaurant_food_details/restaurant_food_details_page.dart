import 'package:multi_restaurant_app/app/core/widgets/app_bar.dart';
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
      backgroundColor: const Color(0xFFF5F5F5),
      // bottomNavigationBar: Row(
      //   children: [
      //     bottomNavigatorBar(
      //       backgroundColor: AppTheme.bText,
      //       color: Colors.white70,
      //       iconColor: Colors.grey,
      //       title: "Add To Favorite",
      //       iconData: Icons.favorite_outline,
      //       // onTap: (){

      //       // }
      //     ),
      //     bottomNavigatorBar(
      //       backgroundColor: AppTheme.secondaryColor,
      //       color: Colors.black,
      //       iconColor: Colors.white,
      //       title: "Add To Cart",
      //       iconData: Icons.shopping_cart_outlined,
      //       // onTap: (){

      //       // }
      //     ),
      //   ],
      // ),
      // appBar: AppBar(
      //   backgroundColor: AppTheme.secondaryColor,
      //   iconTheme: const IconThemeData(color: AppTheme.bText),
      //   title: const Text(
      //     "Food overview",
      //     style: TextStyle(color: AppTheme.bText),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          CustomAppBar(
            leftIcon: Icons.arrow_back,
            leftCallback: () => Navigator.pop(context),
          ),
          Column(
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
                  height: 200,
                  width: 200,
                  placeholder: 'assets/logo/loading.gif',
                  image: ApiUrl.baseURL +
                      restaurantFoodDetailsCtrl.restaurantFood.image,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconText(
                    Icons.access_time_outlined,
                    Colors.blue,
                    '10 Min',
                  ),
                  _buildIconText(
                    Icons.star_outlined,
                    Colors.amber,
                    '4.2',
                  ),
                  _buildIconText(
                    Icons.local_fire_department_outlined,
                    Colors.red,
                    '110 Cal',
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Available Options: ${restaurantFoodDetailsCtrl.restaurantFood.stock}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: AppTheme.secondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.bText,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    FloatingActionButton.extended(
                      backgroundColor: AppTheme.bText,
                      onPressed: () {},
                      isExtended: true,
                      label: const Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: AppTheme.secondaryColor,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add to favorite',
                            style: TextStyle(
                                color: AppTheme.secondaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FloatingActionButton.extended(
                      backgroundColor: AppTheme.secondaryColor,
                      onPressed: () {},
                      isExtended: true,
                      label: const Row(
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add to cart',
                            style: TextStyle(
                                color: AppTheme.bText,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: AppTheme.bText,
          ),
        ),
      ],
    );
  }
}
