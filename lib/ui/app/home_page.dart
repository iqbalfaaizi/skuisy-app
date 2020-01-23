import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/app/widgets/featured_card.dart';
import 'package:skuisy_project/ui/app/widgets/featured_products.dart';
import 'package:skuisy_project/ui/app/widgets/search.dart';
import 'package:skuisy_project/ui/app/widgets/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        FeaturedProducts(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _children = [
      _buildBody(),
    ];

    final bottomNav = new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color(0xff800000),
      ),
      child: new BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.child_friendly),
            title: new Text('Basket'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ));

    return Scaffold(
      appBar: topBar(context),
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNav,
    );
  }
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
