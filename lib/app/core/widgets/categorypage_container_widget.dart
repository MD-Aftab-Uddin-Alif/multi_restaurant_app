import 'package:multi_restaurant_app/package_routes.dart';

class CategoryPageContainerWidget extends StatefulWidget {
  final dynamic restaurant;
  final String route;

  const CategoryPageContainerWidget({
    super.key,
    required this.restaurant,
    required this.route,
  });

  @override
  State<CategoryPageContainerWidget> createState() =>
      _CategoryPageContainerWidgetState();
}

class _CategoryPageContainerWidgetState
    extends State<CategoryPageContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(widget.route);
      },
      child: Container(
        height: 150,
        width: 200,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: AppTheme.secondaryColor,
            width: 1.5,
          ),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      ApiUrl.baseURL + widget.restaurant.image,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Text(
              widget.restaurant.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.restaurant.address,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
