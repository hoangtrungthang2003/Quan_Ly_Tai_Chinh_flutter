import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/home_page.dart';

late Size mq;
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quan ly chi tieu",
      home: HomePage(),
    );
  }
}

class CommonThings {}
