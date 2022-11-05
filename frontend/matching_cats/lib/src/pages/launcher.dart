import 'package:flutter/material.dart';
import 'package:matching_cats/src/pages/MainPage/UI/history_match_page.dart';
import 'MainPage/UI/cats_match_page.dart';
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
      title: "My Cats",
    ),
    const MatchPage(),
    const HistoryMatchPage()
  ];
  final List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Match',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'History',
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
