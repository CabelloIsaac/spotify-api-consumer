import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/widgets.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  firebase.FirebaseAuth _auth;
  firebase.User _user;
  Status _status = Status.Uninitialized;

  AuthProvider.instance() : _auth = firebase.FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  firebase.User get user => _user;
  firebase.FirebaseAuth get auth => _auth;

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      status = Status.Authenticating;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      status = Status.Unauthenticated;
      return false;
    }
  }

  Future signOut() async {
    print('signOut');
    await _auth.signOut();
    status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(firebase.User firebaseUser) async {
    print("_onAuthStateChanged");
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    print("firebaseUser == null: ${firebaseUser == null}");
    notifyListeners();
  }

  static String getCurrentUserUid() {
    return firebase.FirebaseAuth.instance.currentUser.uid;
  }
}
