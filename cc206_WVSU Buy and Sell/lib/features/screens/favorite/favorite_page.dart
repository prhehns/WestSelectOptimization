import 'package:flutter/material.dart';
import '../listing.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  // Mock data for favorite items
  final List<Map<String, String>> favoriteItems = [
    {
      "title": "Onitsuka Tiger",
      "price": "PHP 1,990",
      "imageUrl": "https://via.placeholder.com/150/GreenShoes",
      "seller": "Prince Alexander",
    },
    {
      "title": "Donut 20PCS",
      "price": "PHP 50",
      "imageUrl": "https://via.placeholder.com/150/Donuts",
      "seller": "Prince Alexander",
    },
    {
      "title": "Adidas Ultraboost",
      "price": "PHP 6,000",
      "imageUrl": "https://via.placeholder.com/150/Adidas",
      "seller": "Jane Smith",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: favoriteItems.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            final item = favoriteItems[index];
            return ListingCard(
              title: item['title']!,
              price: item['price']!,
              imageUrl: item['imageUrl']!,
              seller: item['seller']!,
            );
          },
        ),
      )
          : const Center(
        child: Text(
          "No favorites yet!",
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
