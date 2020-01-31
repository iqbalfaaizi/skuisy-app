import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:skuisy_project/data/bloc/cart_bloc.dart';
import 'package:skuisy_project/data/bloc/product_bloc.dart';
import 'package:skuisy_project/src/global_functions.dart';
import 'package:skuisy_project/ui/screens/navigator_page.dart';

class ProductDetails extends StatefulWidget {
  static String tag = 'product-details';
  final int id;
  final String title;
  final String description;
  final int price;
  final int stock;
  final String seller;
  final String picture;

  ProductDetails(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.stock,
      @required this.seller,
      @required this.picture})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState(
      id, title, description, price, stock, seller, picture);
}

class _ProductDetailsState extends State<ProductDetails> {
  GlobalFunctions func = new GlobalFunctions();
  final id, title, description, price, stock, seller, picture;
  _ProductDetailsState(this.id, this.title, this.description, this.price,
      this.stock, this.seller, this.picture);
  final NumberFormat moneyFormat = new NumberFormat("##,##0", "en_US");
  TextEditingController _qtyCtrl = TextEditingController();
  int _qty = 0;
  int _total = 0;

  @override
  void initState() {
    _qtyCtrl = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _qtyCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Color(0xff800000)));
    return Scaffold(body: _buildBody(), bottomSheet: _buildBottomButton());
  }

  Widget _buildBottomButton() {
    final size = MediaQuery.of(context).size;
    // print(_qty);
    // final int _qty = 1;
    print(_qty);
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(3, 0),
            )
          ]),
          height: size.height * 0.08,
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      height: size.height * 0.06,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: GFButton(
                        onPressed: stock == 0
                            ? null
                            : () {
                                cartBloc.addCartUser(title, description, _qty,
                                    price, seller, picture);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavigatorPage()));
                                func.alertDialog(context, 'Added to Cart');
                              },
                        text: 'Add to Cart',
                        color: Colors.deepOrange,
                        type: GFButtonType.outline,
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: size.height * 0.06,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: GFButton(
                        onPressed: stock == 0 ? null : () {},
                        child: Text('Buy Now'),
                        color: Colors.deepOrange,
                        type: GFButtonType.solid,
                      ))),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Container(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildPicture(),
            _buildTitle(),
            _buildRows(),
            _buildQuantity(),
            _buildDesc(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08)
          ],
        ),
      )),
    );
  }

  Widget _buildPicture() {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () {
          print('hahsahd');
        },
        child: Stack(
          children: <Widget>[
            stock != 0
                ? Container(
                    width: size.width,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(picture),
                      ),
                    ),
                  )
                : GFImageOverlay(
                    width: size.width,
                    height: size.height * 0.5,
                    boxFit: BoxFit.fill,
                    image: NetworkImage(picture),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.darken),
                    child: Center(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text('Out of Stock',
                          style: TextStyle(
                              color: Color(0xff800000), fontSize: 28)),
                    ))),
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
                    ])),
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
                        onPressed: () {
                          Navigator.of(context).pop();
                        })),
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
        ));
  }

  Widget _buildTitle() {
    String productPrice = "${moneyFormat.format(price)},-";
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ]),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rp $productPrice',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(height: 10),
          ],
        ));
  }

  Widget _buildRows() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: EdgeInsets.only(top: 1),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _rowDetails('Rating', '5'),
          _rowDetails('Stock', stock.toString()),
          _rowDetails('Condition', 'New'),
          _rowDetails('Sold', '999'),
        ],
      ),
    );
  }

  Widget _rowDetails(String title, String val) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            right: BorderSide(color: Colors.grey, width: 0.1),
            bottom: BorderSide(color: Colors.grey, width: 0.05),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title),
              SizedBox(height: 10),
              title == 'Rating'
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                          Icon(Icons.star_border, color: Colors.deepOrange),
                          Text(val, style: TextStyle(color: Colors.deepOrange))
                        ])
                  : Text(val,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
        ));
  }

  Widget _buildQuantity() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.only(top: 1),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 3,
          offset: Offset(0, 3),
        )
      ]),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Text('Quantity'),
              )),
          Expanded(
            flex: 1,
            child: _quantityCounter(),
          )
        ],
      ),
    );
  }

  Widget _quantityCounter() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    if(_qty != 0) {
                      setState(() {
                        _qty = _qty - 1;
                        _qtyCtrl.text = _qty.toString();
                      });
                    }
                    // returRn _total;
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[200]),
                    child: Icon(Icons.remove),
                  ))),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0',
                  ),
                  textAlign: TextAlign.center,
                  controller: _qtyCtrl,
                  onChanged: (v) => setState(() {
                    _qty == v;
                  }),
                ),
              )),
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if(_qty < stock) {
                        _qty = _qty + 1;
                        _qtyCtrl.text = _qty.toString();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[200]),
                    child: Icon(Icons.add),
                  ))),
        ],
      ),
    );
  }

  Widget _buildDesc() {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          )
        ]),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Product Information',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                _productInfo('Category', ': Kids Apparel'),
                SizedBox(height: 5),
                _productInfo('Weight', ': 1 Kg(s)'),
              ],
            ),
            Container(
                height: 20,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 0.1)))),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description),
            SizedBox(height: 20),
          ],
        ));
  }

  Widget _productInfo(String title, String val) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(title, style: TextStyle(fontSize: 13)),
        ),
        Expanded(
          flex: 1,
          child: Text(val, style: TextStyle(fontSize: 13)),
        ),
      ],
    );
  }
}
