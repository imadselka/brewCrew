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

  //sign in anonymous user

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in wth email and password

  //register with email and password

  // sign out
}
