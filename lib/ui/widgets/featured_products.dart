import 'package:flutter/material.dart';

import 'featured_card.dart';

class FeaturedProducts extends StatefulWidget {
  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height * 0.20,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (_, index) {
              return FeaturedCard(
                name: 'Pasang Iklan',
                picture: '',
              );
            }));
  }
}
