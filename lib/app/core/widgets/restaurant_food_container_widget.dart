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
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
            ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FadeInImage.assetNetwork(
                height: 110,
                width: 110,
                placeholder: 'assets/logo/loading.gif',
                image: ApiUrl.baseURL + widget.restaurantFood.image,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restaurantFood.name,
                          style: const TextStyle(
                            fontSize: 20,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Price: ${widget.restaurantFood.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Taka',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery fee: ${widget.restaurantFood.deliveryFee}',
                          style: const TextStyle(
                            color: AppTheme.secondaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Taka',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppTheme.secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Container(
      //   margin: EdgeInsets.only(right: AppSize.hTen),
      //   width: 120, // todo! change this
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(AppSize.rTen),
      //     color: AppTheme.primaryColor,
      //     boxShadow: [
      //       BoxShadow(
      //         color: AppTheme.secondaryColor.withOpacity(0.3),
      //         blurRadius: 10,
      //         offset: const Offset(5, 5),
      //       ),
      //     ],
      //     border: Border.all(
      //       color: AppTheme.secondaryColor.withOpacity(0.3),
      //       width: 2,
      //     ),
      //   ),
      //   child: Container(
      //     margin: const EdgeInsets.all(0),
      //     width: 120, // todo! change this
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(AppSize.rTen),
      //       color: AppTheme.primaryColor,
      //       //boxShadow: Constant.boxShadow,
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             // * Product Container Image
      //             Center(
      //               child: Container(
      //                 margin: const EdgeInsets.all(0),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(AppSize.rTen),
      //                 ),
      //                 height: 120, // todo! change this
      //                 child: Stack(
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: ClipOval(
      //                         child: FadeInImage.assetNetwork(
      //                           height: 140,
      //                           width: 140,
      //                           placeholder: 'assets/logo/loading.gif',
      //                           image: ApiUrl.baseURL +
      //                               widget.restaurantFood.image,
      //                           fit: BoxFit.fill,
      //                         ),
      //                       ),
      //                     ),

      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(
      //                 top: AppSize.pFive,
      //                 left: AppSize.pFive,
      //                 right: AppSize.pFive,
      //               ),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Center(
      //                     child: Text(
      //                       widget.restaurantFood.name,
      //                       overflow: TextOverflow.ellipsis,
      //                       style: TextStyle(
      //                         fontSize: AppSize.fFourteen,
      //                         color: AppTheme.bText,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   Row(
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: <Widget>[
      //                       AppSize.sbWTen,
      //                       Text(
      //                         '৳',
      //                         style: TextStyle(
      //                           color: AppTheme.secondaryColor,
      //                           fontSize: AppSize.fSixteen,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                       Text(
      //                         widget.restaurantFood.price.toString(),
      //                         style: TextStyle(
      //                           color: AppTheme.secondaryColor,
      //                           fontSize: AppSize.fFourteen,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ],
      //                   ),

      //                   // Constant.sbHFive,
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //         GestureDetector(
      //           onTap: () {},
      //           child: Container(
      //             padding: EdgeInsets.symmetric(vertical: AppSize.hTen),
      //             height: 50,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //               color: AppTheme.secondaryColor,
      //               borderRadius: BorderRadius.circular(AppSize.rTen),
      //             ),
      //             child: Center(
      //                 child: Text(
      //               'See Details',
      //               style: TextStyle(
      //                 fontSize: AppSize.fEighteen,
      //                 color: AppTheme.primaryColor,
      //               ),
      //             )),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
