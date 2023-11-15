// To parse this JSON data, do
//
//     final restaurantFoodModel = restaurantFoodModelFromJson(jsonString);

import 'dart:convert';

List<RestaurantFoodModel> restaurantFoodModelFromJson(String str) =>
    List<RestaurantFoodModel>.from(
        json.decode(str).map((x) => RestaurantFoodModel.fromJson(x)));

String restaurantFoodModelToJson(List<RestaurantFoodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantFoodModel {
  int fId;
  int rId;
  String name;
  String image;
  int price;
  int stock;
  String details;
  int deliveryFee;

  RestaurantFoodModel({
    required this.fId,
    required this.rId,
    required this.name,
    required this.image,
    required this.price,
    required this.stock,
    required this.details,
    required this.deliveryFee,
  });

  factory RestaurantFoodModel.fromJson(Map<String, dynamic> json) =>
      RestaurantFoodModel(
        fId: json["f_id"] as int,
        rId: int.parse(json["r_id"]),
        name: json["name"],
        image: json["image"],
        price: int.parse(json["price"]),
        stock: int.parse(json["stock"]),
        details: json["details"],
        deliveryFee: int.parse(json["delivery_fee"]),
      );

  Map<String, dynamic> toJson() => {
        "f_id": fId,
        "r_id": rId,
        "name": name,
        "image": image,
        "price": price,
        "stock": stock,
        "details": details,
        "delivery_fee": deliveryFee,
      };
}
