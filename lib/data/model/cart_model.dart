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
    int total;
    int grandtotal;

    Cart({
        this.title,
        this.description,
        this.stock,
        this.price,
        this.seller,
        this.picture,
        this.total,
        this.grandtotal
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        title: json["title"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
        seller: json["seller"],
        picture: json["picture"],
        total: json["total"],
        grandtotal: json["grandtotal"]
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "stock": stock,
        "price": price,
        "seller": seller,
        "picture": picture,
        "total": total,
        "grandtotal": grandtotal
    };
}