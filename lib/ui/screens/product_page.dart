import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/widgets/list_product.dart';
import 'package:skuisy_project/ui/widgets/top_bar.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      body: SingleChildScrollView(
          child: Container(
              color: Colors.grey[100],
              child: Column(
                children: <Widget>[Card(child: ListProduct())],
              ))),
    );
  }
}
