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
        onPressed: (){},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartAppBar,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        _buildTotalPayment(),
        _buildCartList()
      ],
    );
  }

  Widget _buildTotalPayment() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2))
      ),
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
                    style: TextStyle(color: Colors.deepOrange, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GFButton(
                onPressed: (){},
                text: 'Checkout',
                shape: GFButtonShape.pills,
                color: Colors.deepOrange,
              )
            )
          )
        ],
      )
    );
  }

  Widget _buildCartList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _itemList.length,
        itemBuilder: (BuildContext contex, int index) {
          return new SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              elevation: 2,
              child: _buildList(index)
            )
          );
        },
      )
    );
  }

  Widget _buildList(int index) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Container(
        alignment: Alignment.topLeft,
        width: 50,
        child: Image(
          image: AssetImage('assets/images/m2.jpg'),
        )
      ),
      title: Text(
        _itemList[index]['product'],
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: _subtitleList(index),
    );
  }

  Widget _subtitleList(int index) {
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
                  _itemList[index]['price'],
                  style: TextStyle(fontSize: 16, color: Colors.deepOrange),
                ),
                SizedBox(height: 5),
                Text('Quantity: 1'),
              ],
            ),
          ),
          _actionButton()
        ],
      )
    );
  }

  Widget _actionButton() {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border, size: 26, color: Colors.black54),
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, size: 26, color: Colors.red,),
              onPressed: (){},
            )
          ],
        ),
      ),
    );
  }
}
