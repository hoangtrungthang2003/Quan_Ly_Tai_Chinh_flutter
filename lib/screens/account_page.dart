import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class account extends StatelessWidget {
  const account({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tài khoản"),
      ),
      body: const BodyScreen(),
    );
  }
}

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/account.jpg",
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: -1,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: Colors.red, // Màu sắc của container nằm trên ảnh
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("21012865"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "21012865@gmail.com",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.wallet,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Ví của tôi",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.userGroup,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Nhóm",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.circleInfo,
                            size: 29,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Hỗ trợ",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.gear,
                            size: 26,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Cài đặt",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            await APIs.auth.signOut().then((value) async {
                              await GoogleSignIn().signOut().then((value) {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(
                                      context); // Close the current screen
                                } else {
                                  // No active route, use push instead of pushReplacement
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginPage()));
                                }
                                APIs.auth = FirebaseAuth
                                    .instance; // Reset the authentication instance
                              });
                            });
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.rightToBracket,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          "Đăng xuất",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
