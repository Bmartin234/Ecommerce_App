import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final String usersCollection = 'users';

  // ইউজারের ডকুমেন্ট লোড
  static Future<Map<String, dynamic>?> getUserDocument(String uid) async {
    try {
      final doc = await _firestore.collection(usersCollection).doc(uid).get();
      if (doc.exists) {
        return doc.data();
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching user document: $e");
      return null;
    }
  }

  // ইউজারের প্রোফাইল আপডেট
  static Future<bool> updateUserProfile({
    required String uid,
    String? name,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? profileImageUrl,
  }) async {
    try {
      final Map<String, dynamic> data = {};
      if (name != null) data['name'] = name;
      if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
      if (dateOfBirth != null) data['dateOfBirth'] = dateOfBirth;
      if (gender != null) data['gender'] = gender;
      if (profileImageUrl != null) data['profileImageUrl'] = profileImageUrl;

      if (data.isNotEmpty) {
        await _firestore.collection(usersCollection).doc(uid).set(
          data,
          SetOptions(merge: true),
        );
      }

      return true;
    } catch (e) {
      print("Error updating user profile: $e");
      return false;
    }
  }

  // ইউজারের নতুন ঠিকানা যোগ
  static Future<bool> addUserAddress({
    required String uid,
    required Map<String, dynamic> address,
  }) async {
    try {
      final docRef = _firestore.collection(usersCollection).doc(uid);
      await docRef.update({
        'addresses': FieldValue.arrayUnion([address])
      });
      return true;
    } catch (e) {
      print("Error adding user address: $e");
      return false;
    }
  }

  // নতুন ইউজারের ডকুমেন্ট তৈরি
  static Future<bool> createUserDocument({
    required String uid,
    required String email,
    required String name,
  }) async {
    try {
      await _firestore.collection(usersCollection).doc(uid).set({
        'email': email,
        'name': name,
        'addresses': [],
        'preferences': {},
        'phoneNumber': null,
      });
      return true;
    } catch (e) {
      print("Error creating user document: $e");
      return false;
    }
  }
}
