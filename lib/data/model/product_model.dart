// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  // List<dynamic> review;
  String id;
  String title;
  String description;
  int price;
  int stock;
  String seller;
  int productId;
  DateTime createdAt;
  int v;

  Product({
    // this.review,
    this.id,
    this.title,
    this.description,
    this.price,
    this.stock,
    this.seller,
    this.productId,
    this.createdAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        // review: List<dynamic>.from(json["review"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        stock: json["stock"],
        seller: json["seller"],
        productId: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        // "review": List<dynamic>.from(review.map((x) => x)),
        "_id": id,
        "title": title,
        "description": description,
        "price": price,
        "stock": stock,
        "seller": seller,
        "id": productId,
        "created_at": createdAt.toIso8601String(),
        "__v": v,
      };
}
