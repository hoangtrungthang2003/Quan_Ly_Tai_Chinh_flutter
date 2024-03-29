import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/main.dart';
import 'package:flutter_quan_li_tai_chinh/models/wallet.dart';
import 'package:flutter_quan_li_tai_chinh/screens/choose_item_screen.dart';
import 'package:flutter_quan_li_tai_chinh/screens/transaction_screen.dart';
import 'package:logger/logger.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key, this.wallet});
  final Wallet? wallet;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String? selectedUrl;
  String? selectedtitle;
  TextEditingController amountInput = TextEditingController();
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Đặt màu trắng cho AppBar
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Đặt chiều cao cho đáy AppBar
          child: Divider(
            thickness: .2,
            color: Colors.grey,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Thêm giao dịch",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: mq.height * .5,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                        width: 15), // Khoảng cách giữa biểu tượng và TextField

                    const Icon(
                      Icons.money,
                      size: 35, // Thay đổi biểu tượng theo nhu cầu của bạn
                      color: Colors.black38,
                    ),
                    const SizedBox(
                        width: 20), // Khoảng cách giữa biểu tượng và TextField
                    Expanded(
                      child: TextField(
                        controller: amountInput,
                        keyboardType: TextInputType.number,
                        style:
                            const TextStyle(color: Colors.green, fontSize: 24),
                        decoration: const InputDecoration(
                          labelText: 'Nhập số tiền',
                          labelStyle: TextStyle(color: Colors.green),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          hoverColor: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ChooseItemScreen()), // Replace YourNewScreen with the actual name of your new screen
                    );

                    setState(() {
                      selectedUrl = result.iconUrl;
                      selectedtitle = result.title;
                    });
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage(selectedUrl ?? 'assets/icon-logo-x.png'),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selectedtitle ?? "Chọn nhóm",
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black38),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.notes_rounded,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Thêm ghi chú",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 0.541)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Hôm nay",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 0.541)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.wallet,
                        size: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Tên ví",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 0.541)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await APIs.addTransaction(widget.wallet, selectedUrl, selectedtitle,
                  amountInput as double)
              .then((value) async {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const TransactionScreen()),
            );
          });
        },
        label: const Text('Lưu giao dịch'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
