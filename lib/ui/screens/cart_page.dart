import 'package:flutter/material.dart';
import 'package:getflutter/components/alert/gf_alert.dart';
import 'package:intl/intl.dart';
import 'package:skuisy_project/data/bloc/cart_bloc.dart';
import 'package:getflutter/getflutter.dart';
import 'package:skuisy_project/data/model/cart_model.dart';
import 'package:skuisy_project/ui/landing_page.dart';
import 'package:skuisy_project/utils/utils.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // int _total = 0;
  Prefs _prefs = new Prefs();
  String email;
  final NumberFormat moneyFormat = new NumberFormat("##,##0", "en_US");
  bool showalert = false;

  @override
  void initState() {
    this._userEmail();
    super.initState();
  }
  
  void _userEmail() async {
    final usermail = await _prefs.getEmail();
    setState(() {
      email = usermail;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _cartAppBar,
      body: email == null ? _buildNoUser() : _buildBody(),
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
    CartBloc cartBloc = CartBloc();
    return Expanded(
      child: StreamBuilder<List<Cart>>(
        stream: cartBloc.cartList,
        builder:(BuildContext context, AsyncSnapshot<List<Cart>> snapshot) {
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
        }
      )
    );
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
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.black),
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
            child: _buildList(_cart)
          )
        );
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
          image: AssetImage('assets/images/m2.jpg'),
        )
      ),
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
              onPressed: (){
                _alertDialog();
                setState(() {
                  showalert = true;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _alertDialog() {
    return GFFloatingWidget(
      child: GFAlert(
        title: 'Welcome !',
        content: 'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
        bottombar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GFButton(
              onPressed: (){
                setState(() {
                  showalert = false;
                });
              },
              shape: GFButtonShape.pills,
              icon: Icon(Icons.keyboard_arrow_right, color: GFColors.getGFColor(GFColor.white),),
              position: GFPosition.end,
              text: 'Learn More',
            )
          ],
        ),
      ), //row
      body:Text('body or any kind of widget here..')
    );
  }

  Widget _buildNoUser() {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        padding: EdgeInsets.only(top: 30, left: 5, right: 5),
        child: Card(
          child: Container(
            height: size.height * 0.18,
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(
                        Icons.accessibility_new,
                        size: 50,
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black12,
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Please Login or Signup to continue!', textAlign: TextAlign.center,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LandingPage()));
                            },
                            color: Colors.lightBlue,
                            child: const Text('Login/Signup',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }

}
