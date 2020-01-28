import 'package:flutter/material.dart';
import 'package:skuisy_project/data/bloc/product_bloc.dart';
import 'package:skuisy_project/data/model/product_model.dart';
import 'package:skuisy_project/ui/screens/product_details.dart';
import 'package:getflutter/getflutter.dart';

class ListProduct extends StatefulWidget {
  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = ProductBloc();

    return StreamBuilder<List<Product>>(
      stream: productBloc.productListAll,
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Align(
              alignment: Alignment.center,
              child: Container(
                height: 200,
                margin: EdgeInsets.only(top: 150),
                child: Text(
                  "No product",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
            );
          } else
            return buildAllProductList(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildAllProductList(AsyncSnapshot snapshot) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              'Our Products',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              itemCount: snapshot.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                Product _product = snapshot.data[index];
                return GestureDetector(
                  child: Card(
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff800000))
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Text(_product.title),
                          Text(_product.description)
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => ProductDetails())
                    );
                  },
                );
              },
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              controller: ScrollController(keepScrollOffset: true),
            )
          ],
        ));
  }
}
