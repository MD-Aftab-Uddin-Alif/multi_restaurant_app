import 'package:multi_restaurant_app/app/core/widgets/app_bar.dart';
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
      backgroundColor: const Color(0xFFF5F5F5),
      // appBar: AppBar(
      //   backgroundColor: AppTheme.secondaryColor,
      //   iconTheme: const IconThemeData(color: AppTheme.bText),
      //   title: const Text(
      //     'Individual Restaurant Food',
      //     style: TextStyle(color: AppTheme.bText),
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            leftIcon: Icons.arrow_back,
            leftCallback: () => Navigator.pop(context),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurantFoodCtrl.restaurant.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text(
                                  '10-20min',
                                  style: TextStyle(
                                      color: AppTheme.bText,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              '2.4Km',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.bText,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Restaurant',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.bText,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FadeInImage.assetNetwork(
                        height: 80,
                        width: 80,
                        placeholder: 'assets/logo/loading.gif',
                        image: ApiUrl.baseURL +
                            restaurantFoodCtrl.restaurant.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(restaurantFoodCtrl.restaurant.address,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.titleColor)),
                    const Row(
                      children: [
                        Icon(Icons.star_outline,
                            color: AppTheme.secondaryColor),
                        Text('4.2',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: PageView(children: [
                ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) =>
                        RestaurantFoodContainerWidget(
                          restaurantFood: restaurantFoodCtrl
                              .specificRestaurantFoodList[index],
                          route:
                              RestaurantFoodDetailsRoutes.restaurantFoodDetails,
                        ),
                    separatorBuilder: (_, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: restaurantFoodCtrl
                        .specificRestaurantFoodListLength.value),
              ]),
            ),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2,
        backgroundColor: AppTheme.secondaryColor,
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
    

  }
}

 // Scaffold(
    //   appBar: AppBar(
    //     iconTheme: const IconThemeData(color: AppTheme.bText),
    //     title: Text(
    //       restaurantFoodCtrl.restaurant.name,
    //       style: const TextStyle(color: AppTheme.bIcon),
    //     ),
    //     centerTitle: true,
    //     backgroundColor: AppTheme.secondaryColor,
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.all(AppSize.pTen),
    //     child: GridView.builder(
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisExtent: 230,
    //         childAspectRatio: 0.8,
    //         crossAxisSpacing: 10,
    //         mainAxisSpacing: 10,
    //       ),
    //       itemCount: restaurantFoodCtrl.specificRestaurantFoodListLength.value,
    //       itemBuilder: (BuildContext context, int index) {
    //         return RestaurantFoodContainerWidget(
    //           restaurantFood:
    //               restaurantFoodCtrl.specificRestaurantFoodList[index],
    //           route: RestaurantFoodDetailsRoutes.restaurantFoodDetails,
    //         );
    //       },
    //     ),
    //   ),
    // );