import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await APIs.auth.signOut().then((value) async {
              await GoogleSignIn().signOut().then((value) {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context); // Close the current screen
                } else {
                  // No active route, use push instead of pushReplacement
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginPage()));
                }
                APIs.auth =
                    FirebaseAuth.instance; // Reset the authentication instance
              });
            });
          },
        ),
      ),
    );
  }
}
