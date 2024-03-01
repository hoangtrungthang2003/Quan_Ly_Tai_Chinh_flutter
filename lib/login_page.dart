import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    APIs.auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _user != null
        ? const HomePage()
        : Scaffold(
            body: Center(
              child: SizedBox(
                height: 50,
                child: SignInButton(
                  Buttons.google,
                  text: "Đăng nhập bằng Google",
                  onPressed: _handleGoogleSignIn,
                ),
              ),
            ),
          );
  }

  void _handleGoogleSignIn() {
    try {
      signInWithGoogle().then((user) async {
        print('\nUser: ${user!.user}');
        print('\n\nUserAdditionalInfo: ${user.additionalUserInfo}');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
        // } else {
        //   await APIs.createUser().then((value) {
        //     Navigator.of(context).pushReplacement(
        //       MaterialPageRoute(builder: (_) => const HomePage()),
        //     );
        //   });
        // }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      // Dialogs.showSnackbar(context, 'Kiểm tra kết nối Internet!');
    }
    return null;
  }
}
