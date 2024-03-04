import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:view/Screens/lineChart.dart';
import 'package:view/Screens/pricePoints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Body_Screen extends StatefulWidget {
  @override
  State<Body_Screen> createState() => _Body_ScreenState();
}

class _Body_ScreenState extends State<Body_Screen> {
  TextEditingController _dateController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.fly,
                    size: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Đi Du Lịch",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.coins,
                    size: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                // mainAxisAlignment: Main,
                children: [
                  Container(
                    width: 351,
                    decoration: BoxDecoration(
                      color: Color(0xFFececf9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Đã chi", style: TextStyle(fontSize: 12)),
                              SizedBox(width: 260),
                              Text("Còn lại", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text("800.000đ", style: TextStyle(fontSize: 12)),
                              SizedBox(
                                width: 215,
                              ),
                              Text("1.200.000đ",
                                  style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                      height: 10,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(
                                            5), // Điều chỉnh giá trị để có độ cong mong muốn
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.calendar,
                    size: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 200,
                      child: Text("20/11/2003"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.wallet),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Tên Ví",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 400,
          height: 10,
          child: Container(
            decoration: BoxDecoration(
              color:
                  Colors.blue, // You can replace this with your desired color
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                child: CustomLineChart(pricePoints),
              ),
              SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text("01/02/2024", style: TextStyle(fontSize: 12)),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("29/02/2024", style: TextStyle(fontSize: 12)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Container(
                  height: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text("Nên chi hằng ngày"),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("0"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  height: 2,
                  color: Color(0xFFccccb3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text("Dự kiến chi tiêu"),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("0"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  height: 2,
                  color: Color(0xFFccccb3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Text("Thực tế chi tiêu hằng ngày"),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("0"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Container(
            height: 15,
            // color: Color(0xFFccccb3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: TextButton(
            onPressed: () {
              print("Danh Sách Giao Dịch");
            },
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF00CB14),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Điều này tạo nút bo tròn
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "DANH SÁCH GIAO DỊCH",
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100), // Adjusted to a reasonable date range
    );

    if (_picked != null) {
      setState(
        () {
          _dateController.text = _picked.toString().split(" ")[0];
        },
      );
    }
  }
}
