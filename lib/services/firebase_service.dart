import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> likeImage(String imageId, String userId) async {
    DocumentReference imageDoc = _firestore.collection('images').doc(imageId);

    await imageDoc.update({
      'likes': FieldValue.arrayUnion([userId])
    });
  }

  static Future<List<String>> getImageLikes(String imageId) async {
    DocumentSnapshot doc = await _firestore.collection('images').doc(imageId).get();
    return List<String>.from(doc['likes']);
  }
}
