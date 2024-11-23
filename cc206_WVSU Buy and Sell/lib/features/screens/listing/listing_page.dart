import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cc206_west_select/features/screens/listing.dart';

class CreateListingPage extends StatefulWidget {
  const CreateListingPage({super.key});

  @override
  _CreateListingPageState createState() => _CreateListingPageState();
}

class _CreateListingPageState extends State<CreateListingPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Listing"),
        actions: [
          TextButton(
            onPressed: createListing,
            child: Text("Publish", style: TextStyle(color: Colors.blue)),
          ),
        ],
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context); // Go back to previous page
          },
          child: Text("Cancel", style: TextStyle(color: Colors.red)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Details
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Product Title"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: "Add description"),
            ),
          ],
        ),
      ),
    );
  }

  // Create listing method
  Future<void> createListing() async {
    try {
      // Get the current user from FirebaseAuth
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        // Handle case where the user is not logged in
        print("No user is logged in.");
        return;
      }

      // Get the current user's UID
      String userId = currentUser.uid;

      // Validate inputs
      if (_titleController.text.isEmpty ||
          _descriptionController.text.isEmpty) {
        // Show an error if any required field is empty
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill all fields")),
        );
        return;
      }

      // Create a Listing object
      final listing = Listing(
        postTitle: _titleController.text,
        postDescription: _descriptionController.text,
        numComments: 0, // Default number of comments
        postUserId: userId,
      );

      // Add listing to Firestore
      await FirebaseFirestore.instance
          .collection('post')
          .add(listing.toFirestore());

      // Go back to the previous page (home page)
      Navigator.pop(context);
    } catch (e) {
      print("Error creating listing: $e");
    }
  }
}
