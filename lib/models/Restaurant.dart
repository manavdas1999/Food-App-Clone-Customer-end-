// Model Class of Restaurant Object

// Converts JSON data from API to Usable form and vice versa
import 'dart:convert';

List<Restaurant> restaurantListFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String welcomeToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.details,
    required this.address,
    required this.phone,
    required this.rating,
    required this.isPopular,
    required this.tags,
    required this.imagePath,
  });

  int id;
  String name;
  String details;
  String address;
  String phone;
  String rating;
  bool isPopular;
  String tags;
  String imagePath;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        address: json["address"],
        phone: json["phone"],
        rating: json["rating"],
        isPopular: json["isPopular"],
        tags: json["tags"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "address": address,
        "phone": phone,
        "rating": rating,
        "isPopular": isPopular,
        "tags": tags,
        "image_path": imagePath,
      };
}
