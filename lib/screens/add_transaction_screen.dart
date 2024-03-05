import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/main.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Đặt màu trắng cho AppBar
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(4.0), // Đặt chiều cao cho đáy AppBar
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black, // Màu và độ trong suốt
                  spreadRadius: 0.1, // Độ mở rộng của bóng mờ
                  blurRadius: 2, // Độ mờ
                  offset:
                      Offset(0, 3), // Vị trí của bóng mờ (dịch ngang, dịch dọc)
                ),
              ],
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close,
              color: Colors.black), // Màu của biểu tượng "X"
          onPressed: () {},
        ),

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
                const Row(
                  children: [
                    SizedBox(
                        width: 15), // Khoảng cách giữa biểu tượng và TextField

                    Icon(
                      Icons.money,
                      size: 35, // Thay đổi biểu tượng theo nhu cầu của bạn
                      color: Colors.black38,
                    ),
                    SizedBox(
                        width: 20), // Khoảng cách giữa biểu tượng và TextField
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.green, fontSize: 24),
                        decoration: InputDecoration(
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
                  onTap: () {},
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage('assets/wallet_icon/savings-icon.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Chọn nhóm",
                        style: TextStyle(
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
        onPressed: () {
          // Hành động khi nút được nhấn
          // Thêm hành động lưu giao dịch ở đây
        },
        label: const Text('Lưu giao dịch'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
