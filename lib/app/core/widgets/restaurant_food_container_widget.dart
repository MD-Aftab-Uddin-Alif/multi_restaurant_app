import 'package:multi_restaurant_app/package_routes.dart';

class RestaurantFoodContainerWidget extends StatefulWidget {
  final dynamic restaurantFood;
  final String route;

  const RestaurantFoodContainerWidget({
    super.key,
    required this.restaurantFood,
    required this.route,
  });

  @override
  State<RestaurantFoodContainerWidget> createState() =>
      _RestaurantFoodContainerWidgetState();
}

class _RestaurantFoodContainerWidgetState
    extends State<RestaurantFoodContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(widget.route, arguments: widget.restaurantFood);
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
            SizedBox(
              width: 90,
              height: 70,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/logo/loading.gif',
                image: ApiUrl.baseURL + widget.restaurantFood.image,
                fit: BoxFit.contain,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/logo/nstu.png');
                },
              ),
            ),
            Text(
              widget.restaurantFood.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.restaurantFood.price.toString(),
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
