import 'package:flutter/material.dart';
import 'package:cc206_west_select/firebase/auth_service.dart';
import 'package:cc206_west_select/features/log_in.dart';
import 'package:cc206_west_select/features/screens/listing.dart';
import 'package:cc206_west_select/features/screens/profile/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTabIndex = 0; // To manage the active tab

  Future<void> _signOut() async {
    await AuthService().signOut(); // Assuming AuthService has a signOut() method
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LogInPage()),
    ); // Redirect to LoginPage after sign-out
  }

  // Mock data for each tab
  final List<Map<String, String>> listings = [
    {
      "title": "Onitsuka Tiger",
      "price": "PHP 1,990",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Prince Alexander",
    },
    {
      "title": "Donut 20PCS",
      "price": "PHP 50",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Prince Alexander",
    },
    {
      "title": "Nike Air Max",
      "price": "PHP 5,499",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "John Doe",
    },
    {
      "title": "Adidas Ultraboost",
      "price": "PHP 6,000",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Jane Smith",
    },
  ];

  final List<Map<String, String>> pending = [
    {
      "title": "Pending Item 1",
      "price": "PHP 2,000",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Pending Seller 1",
    },
    {
      "title": "Pending Item 2",
      "price": "PHP 1,500",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Pending Seller 2",
    },
    {
      "title": "Pending Item 3",
      "price": "PHP 3,000",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Pending Seller 3",
    },
  ];

  final List<Map<String, String>> completed = [
    {
      "title": "Completed Item 1",
      "price": "PHP 2,500",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Completed Seller 1",
    },
    {
      "title": "Completed Item 2",
      "price": "PHP 3,200",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Completed Seller 2",
    },
    {
      "title": "Completed Item 3",
      "price": "PHP 4,000",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Completed Seller 3",
    },
  ];

  // Returns the appropriate list based on the selected tab
  List<Map<String, String>> getCurrentTabData() {
    switch (selectedTabIndex) {
      case 0:
        return listings;
      case 1:
        return pending;
      case 2:
        return completed;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(height: 10),

            // User's Name
            const Text(
              "User's name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Introduction
            const SizedBox(height: 5),
            Text(
              'Introduction about self',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 20),

            // Tab Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton("Listing", 0),
                _buildTabButton("Pending", 1),
                _buildTabButton("Completed", 2),
              ],
            ),
            const SizedBox(height: 20),

            // Content Section (Listing, Pending, Completed)
            Expanded(
              child: GridView.builder(
                itemCount: getCurrentTabData().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final item = getCurrentTabData()[index];
                  return ListingCard(
                    title: item['title']!,
                    price: item['price']!,
                    imageUrl: item['imageUrl']!,
                    seller: item['seller']!,
                  );
                },
              ),
            ),

            // Sign Out Button
            Center(
              child: ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedTabIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
          if (selectedTabIndex == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: Colors.blue,
            ),
        ],
      ),
    );
  }
}
