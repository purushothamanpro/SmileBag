import 'package:SmileBag/Mypages/Login/AuthPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CustomText.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController number = TextEditingController();
  String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "Images/logo.png",
                width: 160,
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomText(text: "Smile Bag", size: 28, weight: FontWeight.bold),
          SizedBox(height: 5),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "Welcome to the"),
            TextSpan(
                text: " Smile Bag",
                style: TextStyle(color: Colors.blue.shade900)),
            TextSpan(text: " app"),
          ], style: TextStyle(color: Colors.black))),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: Offset(2, 1),
                        blurRadius: 2)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: number,
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone_android, color: Colors.grey),
                      border: InputBorder.none,
                      hintText: "9876543210",
                      hintStyle: TextStyle(
                          color: Colors.grey, fontFamily: "Sen", fontSize: 18)),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "After entering your phone number, click on verify to authenticate yourself! Then wait up to 20 seconds to get th OTP and go ahead",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: GestureDetector(
              onTap: () {
                verifyPhone(number.value);
              },
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(2, 1),
                          blurRadius: 2)
                    ],
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: CustomText(
                        text: "Verify",
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> verifyPhone(phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthPage().signIn(authResult);
    };
    final PhoneVerificationFailed verificationfailed =
        (FirebaseAuthException authException) {
      print("${authException.message}");
    };

    final PhoneCodeSent otpsent = (String verId, [int forceResend]) {
      this.verificationId = verId;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: otpsent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
