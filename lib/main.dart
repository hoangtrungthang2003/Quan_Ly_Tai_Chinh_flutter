import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/firebase_options.dart';
import 'package:flutter_quan_li_tai_chinh/login_page.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: LoginPage(),
    );
  }
}
