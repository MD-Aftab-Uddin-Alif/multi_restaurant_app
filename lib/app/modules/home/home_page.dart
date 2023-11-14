import 'package:multi_restaurant_app/app/modules/more/more_page.dart';
import 'package:multi_restaurant_app/package_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  HomeController homeCtrl = Get.find();

  @override
  initState() {
    var passedIndex = Get.arguments;
    if (passedIndex != null) {
      currentIndex = passedIndex;
      passedIndex = null;
    }
    homeCtrl.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          CategoryPage(),
          MorePage(),
        ],
      ),
      // * Add a bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.secondaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),
          
        
          BottomNavigationBarItem(
            icon: Icon(Icons.more_vert_outlined),
            label: "More",
            activeIcon: Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
