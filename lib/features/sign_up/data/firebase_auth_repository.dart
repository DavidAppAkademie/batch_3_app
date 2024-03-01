import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository {
  final FirebaseAuth authInstance;
  FirebaseAuthRepository({required this.authInstance});
  Stream<User?> get onAuthStateChanged => authInstance.authStateChanges();

  /// Login
  Future<void> loginUser(String email, String password) async {
    await authInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Logout
  Future<void> logoutUser() async {
    return authInstance.signOut();
  }

  /// SignUp
  Future<void> register(String email, String password) {
    return authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Reset Password
  Future<void> resetPassword(String email) {
    return authInstance.sendPasswordResetEmail(email: email);
  }

  User? getUser() {
    return authInstance.currentUser;
  }
}
