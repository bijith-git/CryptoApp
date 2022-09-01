import 'package:cryptoapp/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart ' as auth;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final storage = FlutterSecureStorage();

  UserDetails? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return UserDetails(email: user.email!, uid: user.uid);
    }
  }

  Stream<UserDetails?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future createAccount(String email, String passwrd) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: passwrd);
      storeToken(credential);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    } catch (err) {
      rethrow;
    }
  }

  Future signInAccount(String email, String passwrd) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: passwrd);
      storeToken(credential);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    } catch (err) {
      rethrow;
    }
  }

  Future<String?> signOutAccount() async {
    try {
      await _firebaseAuth.signOut();
      await storage.delete(key: 'token');
      await storage.delete(key: 'user');
      return 'success';
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    } catch (err) {
      rethrow;
    }
  }

  Future storeToken(auth.UserCredential credential) async {
    await storage.write(
        key: "token", value: credential.credential!.token.toString());
    await storage.write(key: "user", value: credential.user.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
