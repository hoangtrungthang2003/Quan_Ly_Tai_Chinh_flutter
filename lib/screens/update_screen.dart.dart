import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
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
        SizedBox(
          width: 400,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red, // You can replace this with your desired color
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.confirmation_num_sharp),
                    iconSize: 30,
                  ),
                  Text(
                    "Chọn nhóm",
                    style: TextStyle(fontSize: 20, color: Color(0xff969696)),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.wallet_travel),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "0", // Dòng chữ hiển thị trước khi nhập
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color: Color(0xff26FC3B),
                          ),
                          border: InputBorder
                              .none, // Ẩn đường viền mặc định của TextField
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff26FC3B),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff26FC3B),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.note),
                    iconSize: 30,
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Them ghi chu",
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color: Color(0xff26FC3B),
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: Icon(Icons.add),
                    iconSize: 30,
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: _dateController,
                      decoration: const InputDecoration(
                        labelText: "Date",
                        filled: true,
                        // prefixIcon: Icon(Icons.home),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      readOnly: true,
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.confirmation_num_sharp),
                    iconSize: 30,
                  ),
                  Text(
                    "Tên Ví",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Hành động bạn muốn thực hiện khi nhấp vào văn bản
                      print("Bạn đã nhấp vào văn bản 'Them chi tiet'");
                    },
                    child: Text("Them chi tiet"),
                  ),
                  IconButton(
                    onPressed: () {
                      // Hành động bạn muốn thực hiện khi nhấp vào biểu tượng
                      print("Bạn đã nhấp vào biểu tượng");
                    },
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ],
              )
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Lặp lại ngân sách này",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Ngân sách được tự động lặp lại ở kỳ hạn tiếp theo",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 400,
          height: 25,
          // child: Container(
          //   decoration: BoxDecoration(
          //     color:
          //         Colors.blue, // You can replace this with your desired color
          //   ),
          // ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: () {
              print("Lưu");
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30.0), // Điều này tạo nút bo tròn
              ),
              // Add the boxShadow property here
              backgroundColor:
                  Colors.white, // Set your desired button background color
              shadowColor: Colors.grey, // Set the shadow color
              elevation: 5, // Set the elevation (depth of the shadow)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Lưu",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        )
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
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}