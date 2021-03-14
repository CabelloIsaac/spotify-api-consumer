import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify_api_consumer/models/error_message.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  static const String USER_NOT_FOUND_ERROR = "user-not-found";
  static const String WRONG_PASSWORD_ERROR = "wrong-password";

  firebase.FirebaseAuth _auth;
  firebase.User _user;
  Status _status = Status.Uninitialized;
  ErrorMessage _errorMessage;

  AuthProvider.instance() : _auth = firebase.FirebaseAuth.instance {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  Status get status => _status;
  firebase.User get user => _user;
  firebase.FirebaseAuth get auth => _auth;
  ErrorMessage get errorMessage => _errorMessage;

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  set errorMessage(ErrorMessage value) {
    _errorMessage = value;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      status = Status.Authenticating;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      errorMessage = ErrorMessage(error: false);
    } on FirebaseAuthException catch (e) {
      status = Status.Unauthenticated;
      errorMessage =
          ErrorMessage(code: e.code, message: e.message, error: true);

      if (e.code == USER_NOT_FOUND_ERROR) {
        signUp(email, password);
      }
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      status = Status.Authenticating;
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      errorMessage = ErrorMessage(error: false);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      print(e.message);
      status = Status.Unauthenticated;

      // if (e.toString().contains(ERROR_WRONG_PASSWORD)) {
      //   return ERROR_WRONG_PASSWORD;
      // } else if (e.toString().contains(ERROR_TOO_MANY_REQUESTS)) {
      //   return ERROR_TOO_MANY_REQUESTS;
      // } else if (e.toString().contains(ERROR_USER_NOT_FOUND)) {
      //   return ERROR_USER_NOT_FOUND;
      // } else if (e.toString().contains(ERROR_NETWORK_REQUEST_FAILED)) {
      //   return ERROR_NETWORK_REQUEST_FAILED;
      // } else if (e.toString().contains(ERROR_EMAIL_ALREADY_IN_USE)) {
      //   return ERROR_EMAIL_ALREADY_IN_USE;
      // } else {
      //   return '';
      // }
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
