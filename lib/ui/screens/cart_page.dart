import 'package:flutter/material.dart';
import 'package:skuisy_project/data/bloc/cart_bloc.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:skuisy_project/data/model/cart_model.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _total = 0;

  final _cartAppBar = AppBar(
    title: Text('Cart List', style: TextStyle(color: Colors.white)),
    backgroundColor: Color(0xff800000),
    actions: <Widget>[
      IconButton(
          icon: Icon(
        Icons.dehaze,
        color: Colors.white,
      ))
    ],
  );

  Widget _circularButton(String text) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: RaisedButton(
        color: Color(0xff800000),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, color: Colors.white)),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBody(AsyncSnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext contex, int index) {
        Cart _cart = snapshot.data[index];
        return new SingleChildScrollView(
            child: Card(
                margin: EdgeInsets.symmetric(vertical: 5),
                elevation: 2,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  leading: Container(
                    child: Icon(Icons.pregnant_woman),
                  ),
                  title: Text(
                    _cart.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          _cart.price.toString(),
                          style:
                              TextStyle(fontSize: 16, color: Colors.deepOrange),
                        ),
                        Text(_cart.seller),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite, size: 30),
                              ),
                              _circularButton('-'),
                              Container(
                                width: 60,
                                child: TextField(
                                  autocorrect: false,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: '0',
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff800000))),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.green)),
                                  ),
                                ),
                              ),
                              _circularButton('+'),
                              IconButton(icon: Icon(Icons.delete, size: 30))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartBloc();
    return Scaffold(
        appBar: _cartAppBar,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Card(
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
                            color: GFColor.success,
                          )))
                ],
              )),
            ),
            Expanded(
              child: StreamBuilder<List<Cart>>(
                stream: cartBloc.cartList,
                builder:
                    (BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 200,
                          margin: EdgeInsets.only(top: 150),
                          child: Text(
                            "No Cart",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                      );
                    } else
                      return _buildBody(snapshot);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ));
  }
}
