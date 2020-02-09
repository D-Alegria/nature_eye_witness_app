import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nature_eye_witness_app/models/user.dart';

class AuthService {
  final DatabaseReference userDatabase =
      FirebaseDatabase.instance.reference().child('users');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user) {
    print("Fire$user");
    // Future<User> domainUser = getDomainUser(user.uid).then((onValue));
    // print('domainUser$domainUser');
    return user != null ? new User(uid: user.uid, email: user.email) : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) {
      return _userFromFireBaseUser(user);
    });
    // .map(_userFromFireBaseUser);
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = authResult.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> getDomainUser(String uid) async {
    print(uid);
    return await userDatabase.child(uid).once().then((DataSnapshot snapshot) {
      print("snapshot.value${snapshot.value}");
      return User.fromJson(snapshot.value);
    });
  }

  Future createDomainUser(User user) async {
    try {
      print('json${user.toJson()}');
      await userDatabase.child(user.uid).set(user.toJson());
    } catch (e) {
      print(e);
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password,
      String username, String accountType) async {
    try {
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = authResult.user;
      print('user$user');
      await createDomainUser(
        new User(
            accountType: accountType,
            username: username,
            uid: user.uid,
            email: user.email),
      );
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print('Signed Out');
      return null;
    }
  }
}
