import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/screens/home_page.dart';
import 'package:skuisy_project/ui/screens/profile_page.dart';
import 'package:skuisy_project/ui/widgets/banners.dart';
import '../landing_page.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

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
      Banners(),
      ProfilePage(),
      ProfilePage(),
    ];

    final makeBottom = new FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Color(0xff800000),
        selectedItemBorderColor: Colors.green,
        selectedItemBackgroundColor: Colors.green,
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Colors.white,
      ),
      selectedIndex: _currentIndex,
      onSelectTab: (index) => _onTabTapped(index),
      items: [
        FFNavigationBarItem(
          iconData: Icons.home,
          label: 'Home',
        ),
        FFNavigationBarItem(
          iconData: Icons.shopping_cart,
          label: 'Cart',
        ),
        FFNavigationBarItem(
          iconData: Icons.face,
          label: 'Profile',
        ),
        FFNavigationBarItem(
          iconData: Icons.settings,
          label: 'Settings',
        ),
      ],
    );

    return Scaffold(
      // appBar: topBar(context),
      body: _children[_currentIndex],
      bottomNavigationBar: makeBottom,
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
