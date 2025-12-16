import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_service.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static User? get currentUser => _auth.currentUser;

  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Sign up
  static Future<AuthResult> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await result.user?.updateDisplayName(name);
      await result.user?.reload();

      if (result.user != null) {
        final firestoreSuccess = await FirestoreService.createUserDocument(
          uid: result.user!.uid,
          email: email,
          name: name,
        );

        if (!firestoreSuccess) {
          print("Warning: Failed to create user document in Firestore");
        }
      }

      return AuthResult(
        success: true,
        user: result.user,
        message: 'Account created successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  // Sign in
  static Future<AuthResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult(
        success: true,
        user: result.user,
        message: 'Signed in successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  // Password reset
  static Future<AuthResult> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return AuthResult(
        success: true,
        message: 'Password reset email sent successfully',
      );
    } on FirebaseAuthException catch (e) {
      return AuthResult(success: false, message: _getErrorMessage(e.code));
    } catch (e) {
      return AuthResult(
        success: false,
        message: 'An unexpected error occurred. Please try again.',
      );
    }
  }

  // Sign out
  static Future<AuthResult> signOut() async {
    try {
      await _auth.signOut();
      return AuthResult(success: true, message: "Signed out successfully");
    } catch (e) {
      return AuthResult(
        success: false,
        message: "Failed to sign out. Please try again",
      );
    }
  }

  // Helpers
  static bool get isSignedIn => _auth.currentUser != null;
  static String? get userEmail => _auth.currentUser?.email;
  static String? get userDisplayName => _auth.currentUser?.displayName;
  static String? get userId => _auth.currentUser?.uid;

  static String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'Email-password accounts are not enabled.';
      default:
        return 'An error occurred. Please try again.';
    }
  }
}

class AuthResult {
  final bool success;
  final User? user;
  final String message;

  AuthResult({required this.success, this.user, required this.message});
}
