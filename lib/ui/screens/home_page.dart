import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/widgets/banners.dart';
import 'package:skuisy_project/ui/widgets/featured_products.dart';
import 'package:skuisy_project/ui/widgets/list_product.dart';
import 'package:skuisy_project/ui/widgets/home_actions.dart';
import 'package:skuisy_project/ui/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        Banners(),
        HomeActions(),
        ListProduct()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: _buildBody(),
      // bottomNavigationBar: bottomNav,
    );
  }
}
