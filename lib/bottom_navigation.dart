import 'package:flutter/material.dart';
import 'package:music_app/screens/dashboard/dashboard_screens.dart';
import 'package:music_app/screens/explore/explore_screens.dart';
import 'package:music_app/screens/profile/profile_screens.dart';

class BottomHomeNavigator extends StatefulWidget {
  BottomHomeNavigator({Key? key}) : super(key: key);

  @override
  _BottomHomeNavigatorState createState() {
    return _BottomHomeNavigatorState();
  }
}

class _BottomHomeNavigatorState extends State<BottomHomeNavigator> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[DashboardScreens(), ExploreScreens(), ProfileScreens()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
