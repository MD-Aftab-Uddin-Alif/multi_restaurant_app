import 'package:multi_restaurant_app/package_routes.dart';

List<RestaurantModel> restaurantModelFromJson(String str) =>
    List<RestaurantModel>.from(
        json.decode(str).map((x) => RestaurantModel.fromJson(x)));

String restaurantModelToJson(List<RestaurantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantModel {
  int rId;
  int aId;
  String name;
  dynamic image;
  String address;

  RestaurantModel({
    required this.rId,
    required this.aId,
    required this.name,
    required this.image,
    required this.address,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        rId: json["r_id"] as int,
        aId: int.parse(json["a_id"]),
        name: json["name"],
        image: json["image"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "r_id": rId,
        "a_id": aId,
        "name": name,
        "image": image,
        "address": address,
      };
}
