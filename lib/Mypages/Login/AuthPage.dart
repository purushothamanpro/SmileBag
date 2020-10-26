import 'package:SmileBag/Mypages/Login/Login.dart';
import 'package:SmileBag/Mypages/Shop/ShopHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ShopHomePage();
          } else
            return Login();
        });
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authcre) {
    FirebaseAuth.instance.signInWithCredential(authcre);
  }
}
