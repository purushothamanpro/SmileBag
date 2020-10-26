import 'package:SmileBag/Mypages/Login/AuthPage.dart';
import 'package:SmileBag/Mypages/Shop/ShopHomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: AuthPage().handleAuth(),
      home: ShopHomePage(),
      theme: ThemeData(
          // scaffoldBackgroundColor: Color(0xffd8d9dd),
          primaryColor: Color(0xff6CBE45)),
    ));
