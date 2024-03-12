import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/giao_dich_page/card_item.dart';
import 'package:path_provider/path_provider.dart';

class ChooseItemScreen extends StatefulWidget {
  const ChooseItemScreen({Key? key}) : super(key: key);

  @override
  State<ChooseItemScreen> createState() => _ChooseItemScreenState();
}

class _ChooseItemScreenState extends State<ChooseItemScreen> {
  List<String> listIcons = [];
  List<String> title = [
    'Ăn uống',
    'Du lịch',
    'Mua sắm',
    'Đi chơi',
    'Tiền lương',
    'Học tập',
    'Thể dục',
    'Nghỉ ngơi',
    'Xem phim',
    'Nghe nhạc',
    'Thiết kế',
    'Lập trình',
    'Ngủ đủ giấc',
    'Học nấu ăn',
    'Ngắm cảnh',
    'Chơi game',
    'Tập yoga',
    'Đọc sách',
    'Viết blog',
    'Chụp ảnh',
    'Dự sự kiện',
    'Làm từ thiện',
    'Thăm mưu nghiên cứu',
    'Ngắm sao',
  ];
  @override
  void initState() {
    super.initState();
    loadIcons();
  }

  Future<void> loadIcons() async {
    try {
      ByteData data = await rootBundle.load('AssetManifest.json');
      String manifestContent = utf8.decode(data.buffer.asUint8List());
      Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Lọc ra danh sách các tệp ảnh từ manifest
      List<String> imagePaths = manifestMap.keys
          .where((String key) => key.startsWith('assets/item_icon/'))
          .toList();

      setState(() {
        listIcons = imagePaths;
      });
    } catch (e) {
      print('Error loading icons: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 239, 255),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Chọn nhóm",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabBar(
              tabs: [
                Tab(
                  child: Text("Khoản chi"),
                ),
                Tab(
                  child: Text("Khoản thu"),
                ),
                Tab(
                  child: Text("Vay/Nợ"),
                ),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              splashBorderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(),
            _buildTabContent(),
            _buildTabContent(),
          ],
        ),
      ),
    );
  }

  List<CardItem> cartItems = [];

  Widget _buildTabContent() {
    for (int i = 0; i < title.length; i++) {
      CardItem cartItem = CardItem(
        title: title[i],
        iconUrl: listIcons[i],
      );
      cartItems.add(cartItem);
    }
    return listIcons.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: listIcons.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.pop(context, cartItems[index]);
                  },
                  child:
                      CardItem(title: title[index], iconUrl: listIcons[index]));
            },
          );
  }
}
