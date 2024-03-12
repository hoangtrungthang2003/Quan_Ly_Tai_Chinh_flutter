import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/home_page.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/carousel.dart';
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
            appBar: AppBar(
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage('assets/icon-logo-x.png'),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Quản lý chi tiêu",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CarouselWithDotsPage(),
                Center(
                  child: SizedBox(
                    height: 50,
                    child: SignInButton(
                      Buttons.google,
                      text: "Đăng nhập bằng Google",
                      onPressed: _handleGoogleSignIn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.orange),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void _handleGoogleSignIn() {
    try {
      signInWithGoogle().then((user) async {
        print('\nUser: ${user!.user}');
        print('\n\nUserAdditionalInfo: ${user.additionalUserInfo}');
        await APIs.createUser().then((value) async {
          await APIs.createWallet().then((walletResult) {
            // Check if wallet creation was successful or handle it as needed
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          });
        });
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
