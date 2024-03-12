import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class account extends StatelessWidget {
  const account({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài khoản"),
      ),
      body: BodyScreen(),
    );
  }
}

class BodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
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
                    "assets/wallet_icon/account.png",
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
              SizedBox(
                height: 30,
              ),
              Row(
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
                          icon: FaIcon(
                            FontAwesomeIcons.wallet,
                            size: 24,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Ví của tôi",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.userGroup,
                            size: 24,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Nhóm",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.circleInfo,
                            size: 29,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Hỗ trợ",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.gear,
                            size: 26,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Cài đặt",
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.rightToBracket,
                            size: 24,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
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
