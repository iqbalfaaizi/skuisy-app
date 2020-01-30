import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatefulWidget {
  static String tag = 'product-details';
  final int id;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String seller;
  final String picture;
  
  ProductDetails({
    Key key, 
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.stock,
    @required this.seller,
    @required this.picture
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(id, title, description, price, stock, seller, picture);
}

class _ProductDetailsState extends State<ProductDetails> {
  final id, title, description, price, stock, seller, picture;
  _ProductDetailsState(this.id, this.title, this.description, this.price, this.stock, this.seller, this.picture);
  final NumberFormat moneyFormat = new NumberFormat("##,##0", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomSheet: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text('asdasd')
        ],
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildPicture(),
            _buildTitle(),
            _buildDesc(),
          ],
        ),
      ),
    );
  }

  Widget _buildPicture() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        stock != 0 ? Container(
          width: size.width,
          height: size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(picture),
            ),
          ),
        ) :
        GFImageOverlay(
          width: size.width,
          height: size.height * 0.5,
          boxFit: BoxFit.fill,
          image: NetworkImage(picture),
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text('Out of Stock', style: TextStyle(color: Color(0xff800000), fontSize: 28)),
            )
          )
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.07),
                  Colors.black.withOpacity(0.05),
                  Colors.black.withOpacity(0.025),
                ]
              )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container()),
          ), 
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () { Navigator.of(context).pop(); }
              )
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.shopping_cart),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_border),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    String productPrice = "${moneyFormat.format(price)},-";
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 3,
          offset: Offset(0, 3),
        )]
      ),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle( fontSize: 20 ),
          ),
          SizedBox(height: 10),
          Text(
            'Rp ${productPrice}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),
          ),
          SizedBox(height: 10),
        ],
      )
    );
  }
  
  Widget _buildDesc() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 3,
          offset: Offset(0, 3),
        )]
      ),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle( fontSize: 20 ),
          ),
          SizedBox(height: 10),
          Text(
            price.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange
            ),
          ),
          SizedBox(height: 10),
        ],
      )
    );
  }

}