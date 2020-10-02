import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mypetcare/helpers/errors.dart';
import 'package:mypetcare/helpers/user.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadUser();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseUser user;

  bool loading = false;

  Future<void> singIn({User user, Function onFail, Function sucesso}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.passowrd);
      sucesso();
    } on PlatformException catch (e) {
      print(getErrorString(e.code));
      onFail(getErrorString(e.code));
    }
  }

  Future<void> singUp({User user, Function onFail, Function sucesso}) async {
    setLoading(true);
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.passowrd);

      this.user = result.user;
      user.id = result.user.uid;
      await user.saveDate();
      await Future.delayed(Duration(seconds: 5));
      sucesso();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> _loadUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
    }
    notifyListeners();
  }
}
