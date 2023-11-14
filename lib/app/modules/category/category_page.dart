import 'package:multi_restaurant_app/package_routes.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  HomeController homeCtrl = Get.find();
  CategoryController categoryCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       const DrawerHeader(
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             children: [
      //               CircleAvatar(
      //                 backgroundColor: AppTheme.primaryColor,
      //                 radius: 45,
      //                 child: Image(
      //                   fit: BoxFit
      //                       .cover, // You can use BoxFit.contain, BoxFit.fill, etc.
      //                   image: AssetImage(
      //                     'assets/logo/nstu.png',
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 20,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Text(
      //                     'Arman Ahmed',
      //                     style: TextStyle(
      //                       fontSize: 20,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                   Text(
      //                     'armar@gmail.com',
      //                     style: TextStyle(
      //                       fontSize: 12,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.home),
      //         title: const Text('Home'),
      //         onTap: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) => const HomePage(),
      //             ),
      //           );
      //         },
      //       ),
      //       ListTile(
      //           leading: const Icon(Icons.person),
      //           title: const Text('Personal Details'),
      //           onTap: () {
      //             // Navigator.of(context).push(
      //             //   MaterialPageRoute(
      //             //     builder: (context) => const PersonalDetailsPage(),
      //             //   ),
      //             // );
      //           }),
      //       ListTile(
      //           leading: const Icon(Icons.shopping_cart_checkout),
      //           title: const Text('Order History'),
      //           onTap: () {
      //             // Navigator.of(context).push(
      //             //   MaterialPageRoute(
      //             //     builder: (context) => const BankDetailsPage(),
      //             //   ),
      //             // );
      //           }),
      //       ListTile(
      //         leading: const Icon(Icons.policy),
      //         title: const Text('Terms & Condition'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.app_registration),
      //         title: const Text('SignUp'),
      //         onTap: () {
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => const SignUpPage(),
      //           //   ),
      //           // );
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.login),
      //         title: const Text('SignIn'),
      //         onTap: () {
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => const SignInPage(),
      //           //   ),
      //           // );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: AppTheme.secondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Restaurant',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.titleColor,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      ScaleAnimatedText(
                        'View all',
                        textStyle: TextStyle(
                          fontSize: AppSize.fFourteen,
                          color: AppTheme.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight * 0.26,
              child: Obx(
                () => homeCtrl.restaurantList.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeCtrl.restaurantList.length,
                        itemBuilder: (context, int index) {
                          return Card(
                            elevation: 3,
                            child: Container(
                              width: AppSize.screenHeight * 0.20,
                              color: AppTheme.secondaryColor.withOpacity(0.2),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CategoryPageContainerWidget(
                                    restaurant: homeCtrl.restaurantList[index],
                                    route: HomeRoutes.home,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const Image(
                        image: AssetImage('assets/logo/loading.gif'),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
