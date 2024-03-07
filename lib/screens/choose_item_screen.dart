import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/giao_dich_page/card_item.dart';

class ChooseItemScreen extends StatefulWidget {
  const ChooseItemScreen({Key? key}) : super(key: key);

  @override
  State<ChooseItemScreen> createState() => _ChooseItemScreenState();
}

class _ChooseItemScreenState extends State<ChooseItemScreen> {
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
            _buildTabContent("Ăn uống"),
            _buildTabContent("Ăn uống"),
            _buildTabContent("Ăn uống"),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return ListView(
      children: [
        CardItem(title: title, iconUrl: 'assets/item_icon/cart.png'),
        CardItem(title: title, iconUrl: 'assets/item_icon/cart.png'),
        CardItem(title: title, iconUrl: 'assets/item_icon/cart.png'),
        CardItem(title: title, iconUrl: 'assets/item_icon/cart.png'),
        CardItem(title: title, iconUrl: 'assets/item_icon/cart.png'),
      ],
    );
  }
}
