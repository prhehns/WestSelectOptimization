import 'package:cc206_west_select/features/screens/favorite/favorite_page.dart';
import 'package:cc206_west_select/features/screens/message/message_dart.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';
import 'listing//listing_page.dart';
import 'profile/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  // Navigate to different screens based on selected index
  void _onItemTapped(int index, BuildContext context) {
    setState(() {
      _selectedIndex = index;
    });

    // Use Navigator to push to the respective screen
    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          // ignore: undefined_method
          MaterialPageRoute(builder: (context) => FavoritePage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CreateListingPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          // ignore: undefined_method
          MaterialPageRoute(builder: (context) => MessagePage()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          // ignore: undefined_method
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex, // The currently selected index
      onTap: (index) => _onItemTapped(index, context), // Handle tab click
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt),
          label: 'Listings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}