import 'package:multi_restaurant_app/package_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}

