import 'package:flutter/material.dart';
import 'package:skuisy_project/ui/screens/cart_page.dart';
import 'package:skuisy_project/ui/screens/home_page.dart';
import 'package:skuisy_project/ui/screens/profile_page.dart';
import 'package:skuisy_project/ui/screens/search_page.dart';
import 'package:skuisy_project/ui/screens/setting_page.dart';
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
      CartPage(),
      SearchPage(),
      ProfilePage(),
      SettingPage(),
    ];

    final makeBottom = new FFNavigationBar(
      theme: FFNavigationBarTheme(
        barBackgroundColor: Colors.white,
        selectedItemBorderColor: Colors.transparent,
        selectedItemBackgroundColor: Color(0xff800000),
        selectedItemIconColor: Colors.white,
        selectedItemLabelColor: Color(0xff800000),
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
          iconData: Icons.search,
          label: 'Search',
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
