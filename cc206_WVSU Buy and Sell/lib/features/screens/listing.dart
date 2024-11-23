import 'package:cloud_firestore/cloud_firestore.dart';

class Listing {
  final String postTitle;
  final String postDescription;
  final int numComments;
  final String postUserId;

  Listing({
    required this.postTitle,
    required this.postDescription,
    required this.numComments,
    required this.postUserId,
  });

  // Convert Firestore document to Listing
  factory Listing.fromFirestore(Map<String, dynamic> doc) {
    return Listing(
      postTitle: doc['post_title'] ?? '',
      postDescription: doc['post_description'] ?? '',
      numComments: doc['num_comments'] ?? 0,
      postUserId: doc['post_users'] is DocumentReference
          ? (doc['post_users'] as DocumentReference)
              .id // Get document ID if it's a reference
          : (doc['post_users'] ?? ''), // Otherwise, use the value as a string
    );
  }

  // Convert Listing to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'post_title': postTitle,
      'post_description': postDescription,
      'num_comments': numComments,
      'post_users': postUserId,
    };
  }
}
