import 'package:cc206_west_select/features/screens/favorite/favorite_page.dart';
import 'package:cc206_west_select/features/screens/message/message_dart.dart';
import 'package:flutter/material.dart';
import 'package:cc206_west_select/features/screens/home/home_page.dart';
import 'package:cc206_west_select/features/screens/listing//listing_page.dart';
import 'package:cc206_west_select/features/screens/profile/profile_page.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState  extends State<MainPage>{
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavoritePage(),
    CreateListingPage(),
    MessagePage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurple.withOpacity(0.5),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Listings'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}