import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/models/wallet.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/giao_dich_page/history_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key, this.wallet});
  final Wallet? wallet;

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 239, 255),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Xử lý khi nút tìm kiếm được nhấn
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Xử lý khi nút cài đặt được nhấn
              },
            ),
          ],
          title: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Số dư",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  "5,000,000.00 đ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ]),
          centerTitle: true,
          flexibleSpace: Center(
            child: IntrinsicWidth(
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 8)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
            //       Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => YourNewScreen()), // Replace YourNewScreen with the actual name of your new screen
            // );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 24.0,
                      backgroundImage:
                          AssetImage('assets/wallet_icon/savings-icon.png'),
                    ),
                    SizedBox(width: 10),
                    Text("My wallet name",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: TabBar(
              tabs: [
                Tab(
                  child: Text("11/2023"),
                ),
                Tab(
                  child: Text("Tháng trước"),
                ),
                Tab(
                  child: Text("Tháng này"),
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
          Center(
            child: Text("Không có dữ liệu! Chạm + để thêm giao dịch."),
          ),
          Center(
            child: Text("Không có dữ liệu! Chạm + để thêm giao dịch."),
          ),
          HistoryWidget(),
        ]),
      ),
    );
  }
}
