// Model Class of Food Object

// Converts JSON data from API to Usable form and vice versa

import 'dart:convert';

List<Food> foodListFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));
Food welcomeFromJson(String str) => Food.fromJson(json.decode(str));

String welcomeToJson(Food data) => json.encode(data.toJson());

class Food {
  Food({
    required this.id,
    required this.name,
    required this.details,
    required this.preptime,
    required this.rating,
    required this.imagePath,
    required this.price,
    required this.tags,
    required this.isPopular,
    required this.meal,
    required this.category,
    required this.foodMenu,
  });

  final int id;
  final String name;
  final String details;
  final String preptime;
  final String rating;
  final String imagePath;
  final String price;
  final String tags;
  final bool isPopular;
  final String meal;
  final int category;
  final int foodMenu;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        name: json["name"],
        details: json["details"],
        preptime: json["preptime"],
        rating: json["rating"],
        imagePath: json["image_path"],
        price: json["price"],
        tags: json["tags"],
        isPopular: json["isPopular"],
        meal: json["meal"],
        category: json["category"],
        foodMenu: json["food_menu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "details": details,
        "preptime": preptime,
        "rating": rating,
        "image_path": imagePath,
        "price": price,
        "tags": tags,
        "isPopular": isPopular,
        "meal": meal,
        "category": category,
        "food_menu": foodMenu,
      };
}
