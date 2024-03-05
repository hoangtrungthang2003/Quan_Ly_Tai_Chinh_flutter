import 'package:flutter/material.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  left:
                                      0, // Điều chỉnh giá trị left để định vị hộp màu xanh
                                  child: Container(
                                    width: 200,
                                    color: Colors.green,
                                    height: 15,
                                  ),
                                ),
                                // Positioned(
                                //   left:
                                //       0, // Điều chỉnh giá trị left để định vị hộp màu amber
                                //   child: Container(
                                //     color: Colors.amber,
                                //     width: 20,
                                //     height: 20,
                                //     decoration: BoxDecoration(
                                //       borderRadius:
                                //           BorderRadius.circular(20),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Số tiền bạn có thể chi",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "0",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "1K",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Tổng Ngân Sách"),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Tổng Đã Chi"),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "9 Ngày",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Đến Cuối Tháng"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: TextButton(
                  onPressed: () {
                    print("Danh Sách Giao Dịch");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00CB14),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Điều này tạo nút bo tròn
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Tạo Ngân Sách",
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
          child: Container(
            color: const Color(0xFFf2e6ff),
          ),
        ),
        buildSection("Mua sam", "100.000", "10003", "Hom nay"),
        SizedBox(
          height: 20,
          child: Container(
            color: Colors.red,
          ),
        ),
        buildSection("Xem phim", "100.000", "10003", "Hom nay"),
        SizedBox(
          height: 20,
          child: Container(
            color: Colors.red,
          ),
        ),
        buildSection("Mua sam", "100.000", "10003", "Hom nay"),
      ],
    );
  }

  Widget buildSection(
      String title, String price, String subTitle, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Container(
            color: const Color(0xFFf6f8fa),
            child: Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(title),
                const Spacer(),
                Text(price),
              ],
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Text(subTitle),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 50),
              Stack(
                children: [
                  Container(
                    height: 10,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  Positioned(
                    left: 400, // Adjusted left value
                    child: Container(
                      height: 10,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
