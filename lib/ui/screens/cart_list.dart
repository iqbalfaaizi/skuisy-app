import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:skuisy_project/data/bloc/cart_bloc.dart';
import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/data/model/product_model.dart';

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  int _itemCount = 0;
  TextEditingController _countCtrl = new TextEditingController();

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

  List _itemList = [
    {'product': 'Bearnie doll', 'price': 'Rp 13.000.000', 'seller': 'Pedoshop'},
    {
      'product': 'Micin Grade-Ori 1KG | Super White Micin',
      'price': 'Rp 139.600.000',
      'seller': 'Herbal Store'
    },
    {
      'product': 'Sepatu Aladin Ujing Lincip | Emas | Asli Mesir',
      'price': 'Rp 88.000.000',
      'seller': 'OriShoesOnly'
    },
    {
      'product': 'Akik Stone Super Extra Top Quality #1',
      'price': 'Rp 100.000.000',
      'seller': 'RubyStone'
    }
  ];

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

  Widget _itemActions() {
    return Container(
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
                    borderSide: BorderSide(color: Color(0xff800000))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
              ),
            ),
          ),
          _circularButton('+'),
          IconButton(icon: Icon(Icons.delete, size: 30))
        ],
      ),
    );
  }

  Widget _subtitleList(int index) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Text(
            _itemList[index]['price'],
            style: TextStyle(fontSize: 16, color: Colors.deepOrange),
          ),
          Text(_itemList[index]['seller']),
          SizedBox(height: 10),
          _itemActions(),
        ],
      ),
    );
  }

  Widget _buildList(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
        child: Icon(Icons.pregnant_woman),
      ),
      title: Text(
        _itemList[index]['product'],
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: _subtitleList(index),
    );
  }

  Widget _buildBody() {
    return new Column(
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
            child: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (BuildContext contex, int index) {
            return new SingleChildScrollView(
                child: Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    elevation: 2,
                    child: _buildList(index)));
          },
        ))
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartBloc();
    return Scaffold(
      appBar: _cartAppBar,
      body: _buildBody(),
    
    );
  }
}
