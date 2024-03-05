import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/giao_dich_page/history_widget.dart';

class ListTransaction extends StatefulWidget {
  const ListTransaction({super.key});

  @override
  State<ListTransaction> createState() => _ListTransactionState();
}

class _ListTransactionState extends State<ListTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 255),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close,
              color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Danh sách giao dịch",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: const HistoryWidget(),
    );
  }
}
