import 'package:flutter/material.dart';
import 'MainPage/UI/home_page.dart';

class LauncherPage extends StatefulWidget {
  static const routeName = '/';

  const LauncherPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LauncherPageState();
  }
}

class _LauncherPageState extends State<LauncherPage> {
  int _selectedIndex = 0;
  final List<Widget> _pageWidget = <Widget>[
    const HomePage(
      title: "home",
    ),
    const HomePage(
      title: "home",
    ),
  ];
  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}