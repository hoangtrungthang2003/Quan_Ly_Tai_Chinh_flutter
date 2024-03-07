import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/home_page/customCard2.dart';

class ListTransactionWidget extends StatefulWidget {
  const ListTransactionWidget({super.key});

  @override
  State<ListTransactionWidget> createState() => _ListTransactionWidgetState();
}

class _ListTransactionWidgetState extends State<ListTransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: const Column(
              children: [
                Text("3 kết quả",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Khoản thu"),
                    Text(
                      "600,000.00 đ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Khoản chi"),
                    Text(
                      "100,000.00 đ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                          fontSize: 16),
                    ),
                  ],
                ),
                Divider(
                  thickness: .15,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(""),
                    Text(
                      "500,000.00 đ",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                          fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _list_day_history(),
          _list_day_history(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _list_day_history() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("17",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Hôm qua",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "tháng 1 2024",
                        style: TextStyle(fontSize: 12.0, color: Colors.black45),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              Text(
                '450,000.00 \u0111',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Divider(thickness: .15, color: Colors.grey),
          CustomCard2(
              title: "Ăn uống",
              des: "rất ngon",
              price: 20000,
              iconUrl: "assets/item_icon/tennis.png"),
          CustomCard2(
              title: "Ăn uống",
              des: "rất ngon",
              price: 20000,
              iconUrl: "assets/item_icon/tennis.png"),
        ],
      ),
    );
  }
}
