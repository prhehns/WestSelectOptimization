import 'package:flutter/material.dart';
import 'package:cc206_west_select/features/screens/listing.dart'; // Ensure this path is correct

class CreateListingPage extends StatelessWidget {
  CreateListingPage({super.key});

  final List<Map<String, String>> products = [
    {
      "title": "Onitsuka Tiger",
      "price": "PHP 1,990",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Prince Alexander"
    },
    {
      "title": "Donut 20PCS",
      "price": "PHP 50",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Prince Alexander"
    },
    {
      "title": "Nike Air Max",
      "price": "PHP 5,499",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "John Doe"
    },
    {
      "title": "Adidas Ultraboost",
      "price": "PHP 6,000",
      "imageUrl": "https://via.placeholder.com/150",
      "seller": "Jane Smith"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Listings"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListingCard(
              title: product['title'] ?? 'Unknown Title',
              price: product['price'] ?? 'Unknown Price',
              imageUrl:
                  product['imageUrl'] ?? 'https://via.placeholder.com/150',
              seller: product['seller'] ?? 'Unknown Seller',
            );
          },
        ),
      ),
    );
  }
}
