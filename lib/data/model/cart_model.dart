// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

List<Cart> cartFromJson(String str) => List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
    String title;
    String description;
    int stock;
    int price;
    String seller;
    String picture;

    Cart({
        this.title,
        this.description,
        this.stock,
        this.price,
        this.seller,
        this.picture
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        title: json["title"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        seller: json["seller"],
        picture: json["picture"]
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "stock": stock,
        "price": price,
        "seller": seller,
        "picture": picture
    };
}