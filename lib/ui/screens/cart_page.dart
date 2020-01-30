import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skuisy_project/data/bloc/cart_bloc.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/src/global_functions.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  GlobalFunctions func = new GlobalFunctions();
  
  int _total = 0;
  final NumberFormat moneyFormat = new NumberFormat("##,##0", "en_US");

  final _cartAppBar = AppBar(
    title: Text('Cart List', style: TextStyle(color: Colors.white)),
    backgroundColor: Color(0xff800000),
    actions: <Widget>[
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.dehaze,
            color: Colors.white,
          ))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartAppBar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[_buildTotalPayment(), _buildCartList()],
    );
  }

  Widget _buildTotalPayment() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Total Harga',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp 1.000.326.122',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GFButton(
                      onPressed: () {},
                      text: 'Checkout',
                      shape: GFButtonShape.pills,
                      color: Colors.deepOrange,
                    )))
          ],
        ));
  }

  Widget _buildCartList() {
    CartBloc cartBloc = CartBloc();
    return Expanded(
        child: StreamBuilder<List<Cart>>(
            stream: cartBloc.cartList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.length == 0) {
                  _noData();
                } else {
                  return _buildCartData(snapshot);
                }
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _noData() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 200,
        margin: EdgeInsets.only(top: 150),
        child: Text(
          "No Cart",
          // textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildCartData(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext contex, int index) {
        Cart _cart = snapshot.data[index];
        return new SingleChildScrollView(
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 5),
                elevation: 2,
                child: _buildList(_cart)));
      },
    );
  }

  Widget _buildList(Cart _cart) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
          alignment: Alignment.topLeft,
          width: 50,
          child: Image(
            image: NetworkImage(_cart.picture),
          )),
      title: Text(
        _cart.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: _subtitleList(_cart),
    );
  }

  Widget _subtitleList(Cart _cart) {
    String productPrice = "Rp ${moneyFormat.format(_cart.price)},-";
    return Container(
        child: Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                productPrice,
                style: TextStyle(fontSize: 16, color: Colors.deepOrange),
              ),
              SizedBox(height: 5),
              Text(_cart.stock.toString()),
            ],
          ),
        ),
        _actionButton(_cart)
      ],
    ));
  }

  Widget _actionButton(Cart _cart) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.favorite_border, size: 26, color: Colors.black54),
            ),
            IconButton(
              icon: Icon(
                Icons.delete_outline,
                size: 26,
                color: Colors.red,
              ),
              onPressed: () {
                func.alertDialog(context, 'Deleted');
                cartBloc.removeCartProduct(_cart.title, _cart.description,
                    _cart.stock, _cart.price, _cart.seller, _cart.picture);
                
              },
            )
          ],
        ),
      ),
    );
  }
}
