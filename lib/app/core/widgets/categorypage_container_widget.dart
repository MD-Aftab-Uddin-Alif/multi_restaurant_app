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
        Get.toNamed(widget.route, arguments: widget.restaurant);
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
              width: 70,
              height: 70,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/logo/loading.gif',
                image: ApiUrl.baseURL + widget.restaurant.image,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/logo/nstu.png');
                },
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
