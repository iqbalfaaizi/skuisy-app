import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/screens/home_page.dart';
import 'package:skuisy_project/ui/screens/profile_page.dart';

import '../landing_page.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomePage(),
      ProfilePage(),
      LandingPage(),
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
      // appBar: topBar(context),
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
