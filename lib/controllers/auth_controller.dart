import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/firebase_auth_service.dart';
import '../services/firestore_service.dart';

// Assuming AuthResult class is defined somewhere
// class AuthResult { ... }


// UPDATED: MongoApiService ক্লাসে loginUser ফাংশন যোগ করা হলো
class MongoApiService {
  static const String registerApiUrl = "http://localhost:5000/api/register/register";
  // ADDED: লগইন API এন্ডপয়েন্ট
  static const String loginApiUrl = "http://localhost:5000/api/register/login";

  static Future<AuthResult> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    // ... (আপনার পূর্বের রেজিস্ট্রেশন লজিক এখানে আছে)
    try {
      final Map<String, dynamic> requestBody = {
        'name': name,
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(registerApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthResult(
          success: true,
          message: responseBody['message'] ?? "Account created successfully via MongoDB API.",
          user: null,
        );
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        return AuthResult(
          success: false,
          message: responseBody['message'] ?? "Registration failed. Please check your inputs.",
          user: null,
        );
      } else {
        return AuthResult(
          success: false,
          message: "Server Error (${response.statusCode}): ${responseBody['message'] ?? 'An unknown server error occurred.'}",
          user: null,
        );
      }
    } catch (e) {
      print("MongoDB API Call Error: $e");
      return AuthResult(
        success: false,
        message: "Network Error: Could not connect to the MongoDB API server.",
        user: null,
      );
    }
  }

  // ADDED: লগইন ফাংশন
  static Future<AuthResult> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> requestBody = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse(loginApiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // সফল লগইন
        // সফল হলে সাধারণত সার্ভার থেকে একটি টোকেন (Token) বা ইউজার ডেটা পাঠায়
        final token = responseBody['token']; // যদি আপনার API টোকেন পাঠায়

        // এখানে আপনি টোকেনটি GetStorage-এ সংরক্ষণ করতে পারেন:
        // final _storage = GetStorage();
        // await _storage.write('authToken', token);

        return AuthResult(
          success: true,
          message: responseBody['message'] ?? "Login successful via MongoDB API.",
          user: null, // MongoDB API থেকে Firebase User object পাওয়া যায় না
        );
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        // ক্লায়েন্ট এরর (যেমন: ভুল পাসওয়ার্ড বা ইমেইল)
        return AuthResult(
          success: false,
          message: responseBody['message'] ?? "Login failed. Check email and password.",
          user: null,
        );
      } else {
        // সার্ভার এরর
        return AuthResult(
          success: false,
          message: "Server Error (${response.statusCode}): ${responseBody['message'] ?? 'An unknown server error occurred.'}",
          user: null,
        );
      }
    } catch (e) {
      print("MongoDB Login API Call Error: $e");
      return AuthResult(
        success: false,
        message: "Network Error: Could not connect to the MongoDB API server for login.",
        user: null,
      );
    }
  }
}
// END OF UPDATED MongoApiService


class AuthController extends GetxController {
  final _storage = GetStorage();

  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIN = false.obs;
  final Rx<User?> _user = Rx<User?>(null);
  final RxBool _isLoading = false.obs;
  final Rx<Map<String, dynamic>?> _userDocument = Rx<Map<String, dynamic>?>(null);

  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIN.value;
  User? get user => _user.value;
  bool get isLoading => _isLoading.value;

  String? get userEmail => _user.value?.email;
  String? get userDisplayName => _user.value?.displayName;

  Map<String, dynamic>? get userDocument => _userDocument.value;

  String? get userName =>
      _userDocument.value?['name'] ?? _user.value?.displayName;

  String? get userPhone => _userDocument.value?['phoneNumber'];
  List<dynamic>? get userAddresses => _userDocument.value?['addresses'];
  Map<String, dynamic>? get userPreferences =>
      _userDocument.value?['preferences'];

  @override
  void onInit() {
    super.onInit();
    _loadInitialState();
    listenToAuthChanges();
  }

  void _loadInitialState() {
    _isFirstTime.value = _storage.read('isFirstTime') ?? true;

    //
    _user.value = FirebaseAuthService.currentUser;
    if (_user.value != null) {
      _loadUserDocument(_user.value!.uid);
      _isLoggedIN.value = true;
    }
  }

  Future<void> _loadUserDocument(String uid) async {
    try {
      final userDoc = await FirestoreService.getUserDocument(uid);
      _userDocument.value = userDoc;
    } catch (e) {
      print("Error loading user document: $e");
    }
  }

  void listenToAuthChanges() {
    FirebaseAuthService.authStateChanges.listen((User? user) {
      _user.value = user;
      _isLoggedIN.value = user != null;

      if (user != null) {
        _loadUserDocument(user.uid);
      } else {
        _userDocument.value = null;
      }
    });
  }

  void setFirstTimeDone() async {
    _isFirstTime.value = false;
    await _storage.write('isFirstTime', false);
  }

  Future<AuthResult> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    _isLoading.value = true;

    try {
      final mongoResult = await MongoApiService.registerUser(
        email: email,
        password: password,
        name: name,
      );

      if (mongoResult.success) {
        // Firebase লজিক বাদ দিয়ে MongoDB-র ফলই রিটার্ন করছে
        return mongoResult;
      } else {
        return mongoResult;
      }
    } finally {
      _isLoading.value = false;
    }
  }

  // CHANGED: MongoDB API কল করার জন্য signIn লজিক পরিবর্তন করা হলো
  Future<AuthResult> signIn({
    required String email,
    required String password,
  }) async {
    _isLoading.value = true;

    try {
      // Step 1: MongoDB API কল করে লগইন করা
      final mongoResult = await MongoApiService.loginUser(
        email: email,
        password: password,
      );

      if (mongoResult.success) {
        // সফল MongoDB লগইনের পর, যদি আপনার Firebase লজিক লাগে
        // তবে আপনাকে এখানে Firebase এর অন্য কোনো ফাংশন কল করতে হবে,
        // যেমন: custom token দিয়ে signInWithCustomToken (যদি API টোকেন দেয়)।
        // কিন্তু যেহেতু আপনি শুধু API লজিক যোগ করতে বলেছেন, তাই শুধু MongoDB-র ফলই রিটার্ন করবে।

        // যদি Firebase এর মাধ্যমে Auth স্টেট পরিবর্তন করতে চান,
        // তবে এখানে আপনি একটি ডামি বা কাস্টম Firebase ইউজার তৈরি করে
        // _user.value = your_custom_user; এই কাজটি করতে পারেন।

        // বর্তমান লজিক: শুধু MongoDB API এর ফল রিটার্ন করবে
        return mongoResult;
      }

      return mongoResult;
    } finally {
      _isLoading.value = false;
    }
  }
  // END OF CHANGED signIn METHOD

  Future<AuthResult> sendPasswordResetEmail({
    required String email,
  }) async {
    _isLoading.value = true;
    try {
      return await FirebaseAuthService.sendPasswordResetEmail(email: email);
    } finally {
      _isLoading.value = false;
    }
  }

  Future<AuthResult> signOut() async {
    _isLoading.value = true;
    try {
      return await FirebaseAuthService.signOut();
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> updateUserProfile({
    String? name,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? profileImageUrl,
  }) async {
    if (_user.value == null) return false;

    _isLoading.value = true;

    try {
      final success = await FirestoreService.updateUserProfile(
        uid: _user.value!.uid,
        name: name,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
        gender: gender,
        profileImageUrl: profileImageUrl,
      );

      if (success) {
        await _loadUserDocument(_user.value!.uid);
      }

      return success;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> addUserAddress(Map<String, dynamic> address) async {
    if (_user.value == null) return false;

    _isLoading.value = true;

    try {
      final success = await FirestoreService.addUserAddress(
        uid: _user.value!.uid,
        address: address,
      );

      if (success) {
        await _loadUserDocument(_user.value!.uid);
      }

      return success;
    } finally {
      _isLoading.value = false;
    }
  }
}