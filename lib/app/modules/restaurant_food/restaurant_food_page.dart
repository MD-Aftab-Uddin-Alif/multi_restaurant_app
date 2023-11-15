import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'restaurant_food_controller.dart';

class RestaurantFoodPage extends GetView<RestaurantFoodController> {
  const RestaurantFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestaurantFoodPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RestaurantFoodPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
