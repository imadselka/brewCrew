import 'package:brew_crew/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Latest version :

  // 'FirebaseUser' with 'User'
  // '_auth.onAuthStateChanged' with '_auth.authStateChanges()'
  // 'Firestore' with 'FirebaseFirestore'
  // 'document' with 'doc'
  // 'setData' with 'set'
  // FirebaseUser has been changed to User
  // AuthResult has been changed to UserCredential
  // GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()
  // onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()
  // currentUser() which is a method to retrieve the currently logged in user,
  // was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>

  //create user obj base on FirebaseUser

  UserObj? _userFromFirebaseUser(User user) {
    return user != null ? UserObj(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<UserObj?> get user {
    return _auth.authStateChanges().map<UserObj?>(
        (User? user) => user != null ? _userFromFirebaseUser(user) : null);
  }

  //sign in anonymous user

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in wth email and password

  //register with email and password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
