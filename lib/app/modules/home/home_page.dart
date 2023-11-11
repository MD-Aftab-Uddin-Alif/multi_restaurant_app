import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_restaurant_app/app/core/size/app_size.dart';
import 'package:multi_restaurant_app/app/core/theme/app_theme.dart';
import 'package:multi_restaurant_app/app/core/widgets/homepage_container_widget.dart';
import 'package:multi_restaurant_app/app/routes/home_routes.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeCtrl = Get.find();

  @override
  void initState() {
    homeCtrl.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: CircleAvatar(
                        backgroundColor: AppTheme.primaryColor,
                        backgroundImage: AssetImage(
                          'assets/images/logos/farmer.png',
                        ),
                        radius: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => const Text(
                            'name',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Obx(
                          () => const Text(
                            'email',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Personal Details'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const PersonalDetailsPage(),
                  //   ),
                  // );
                }),
            ListTile(
                leading: const Icon(Icons.comment_bank),
                title: const Text('Order History'),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const BankDetailsPage(),
                  //   ),
                  // );
                }),
            ListTile(
              leading: const Icon(Icons.policy),
              title: const Text('Terms & Condition'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('SignUp'),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SignUpPage(),
                //   ),
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('SignIn'),
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const SignInPage(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
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
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: TextStyle(
                      fontSize: AppSize.fFourteen,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppSize.screenHeight * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Container(
                      width: AppSize.screenHeight * 0.18,
                      color: AppTheme.secondaryColor.withOpacity(0.2),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomePageContainerWidget(
                            label: 'Restaurant',
                            image: 'assets/logo/nstu.png',
                            route: HomeRoutes.home,
                            banner: '',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      
      
      
      
    
    );
  }
}
