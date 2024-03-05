import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/giao_dich_page/card_item.dart';

class ChooseItemScreen extends StatefulWidget {
  const ChooseItemScreen({super.key});

  @override
  State<ChooseItemScreen> createState() => _ChooseItemScreenState();
}

class _ChooseItemScreenState extends State<ChooseItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Chọn nhóm",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: TabBar(
            tabs: [
              Tab(
                child: Text("Khoản chi"),
              ),
              Tab(
                child: Text("Khoản thu"),
              ),
              Tab(
                child: Text("Đi vay/cho vay"),
              ),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            splashBorderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      body: const TabBarView(children: [
        Column(
          children: [
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
          ],
        ),
        Column(
          children: [
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
          ],
        ),
        Column(
          children: [
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
            CardItem(title: "Ăn uống", iconUrl: 'assets/item_icon/cart.png'),
          ],
        ),
      ]),
    );
  }
}
