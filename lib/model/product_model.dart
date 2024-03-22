// ignore_for_file: constant_identifier_names, implementation_imports

import 'dart:convert';

import 'package:flutter/src/material/card.dart';

List<ProductModel> productModelFromMap(String str) => List<ProductModel>.from(
      json.decode(str).map((x) => ProductModel.fromMap(x)),
    );

String productModelToMap(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category:
            categoryValues.map[json["category"]] ?? Category.MEN_S_CLOTHING,
        image: json["image"],
        rating: Rating.fromMap(json["rating"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverseMap[category],
        "image": image,
        "rating": rating.toMap(),
      };

  static ProductModel fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      category: categoryValues.map[json["category"]] ?? Category.MEN_S_CLOTHING,
      image: json["image"],
      rating: Rating.fromMap(json["rating"]),
    );
  }

  map(Card Function(dynamic item) param0) {}
}

enum Category {
  ELECTRONICS,
  JEWELERY,
  MEN_S_CLOTHING,
  WOMEN_S_CLOTHING,
}

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING,
});

class Rating {
  final double rate;
  final int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  get reverse => reverseMap;

  Map<T, String> get reverseMape {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
