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
      postUserId: doc['post_users'] ?? '',
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
