import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/models/wallet.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/home_page/customCard.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/home_page/customCard2.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_quan_li_tai_chinh/models/CostData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.wallet});
  final Wallet wallet;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'en_US', symbol: '');
    final amountfm = widget.wallet != null
        ? currencyFormatter.format(widget.wallet.amount)
        : '';
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 255),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // Body Screen
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isHidden
                                ? const Text(
                                    '**********',
                                    style: TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  )
                                : Text(
                                    '$amountfm ₫',
                                    style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isHidden = !isHidden;
                                });
                              },
                              child: isHidden
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.remove_red_eye_outlined),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            // Xử lý khi nút tìm kiếm được nhấn
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Tổng số dư",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(width: 5),
                        Center(
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: .5,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.question_mark_sharp,
                                size: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: .5))),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ví của tôi",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                "Xem tất cả",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24.0,
                                  backgroundImage:
                                      AssetImage(widget.wallet.image),
                                ),
                                const SizedBox(width: 10),
                                Text(widget.wallet.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Text(
                              "$amountfm ₫",
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ]),
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Báo cáo chi tiêu",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                        Text(
                          "Xem báo cáo",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _grapChiTieu(),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Giao dịch gần đây",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                        Text(
                          "Xem tất cả",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _recentTransaction(),
                  ],
                ), // Body Screen
              ),
            ),
    );
  }

  Widget _grapChiTieu() {
    final ValueNotifier<int> tabIndexBasicToggle = ValueNotifier(0);
    List<String> listTextTabToggle = ["Tuần", "Tháng"];
    List<Widget> listGrapPage = [_grapTuan(), _grapThang()];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: tabIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: const Color.fromARGB(224, 224, 224, 224)),
                    borderRadius: BorderRadius.circular(12)),
                child: FlutterToggleTab(
                  width: 75,
                  borderRadius: 10,
                  height: 40,
                  selectedIndex: currentIndex,
                  selectedBackgroundColors: const [
                    Colors.white,
                    Colors.white,
                  ],
                  selectedTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  unSelectedTextStyle: const TextStyle(
                    color: Color.fromARGB(115, 0, 0, 0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  labels: listTextTabToggle,
                  selectedLabelIndex: (index) {
                    tabIndexBasicToggle.value = index;
                  },
                  isScroll: false,
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: tabIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return Center(
                child: listGrapPage[currentIndex],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _grapTuan() {
    List<CostData> data = [
      CostData('Tuần trước', 1.5, Colors.blue),
      CostData('Tuần này', 2, Colors.amber)
    ];
    return Center(
      child: Column(
        children: [
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(
                text: '230,000.00 ₫',
                textStyle: TextStyle(fontWeight: FontWeight.w500),
              ),
              legend: const Legend(
                isVisible: true,
                position: LegendPosition.top,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<CostData, String>>[
                ColumnSeries<CostData, String>(
                    dataSource: data,
                    animationDuration: 1000,
                    name: "Tổng chi tiêu tuần",
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    xValueMapper: (CostData sales, _) => sales.times,
                    yValueMapper: (CostData sales, _) => sales.prices,
                    pointColorMapper: (CostData sales, _) => sales.colors,
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Chi tiêu nhiều nhất",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const CustomCard(
              title: 'Ăn uống',
              des: '150,000 ₫',
              persent: 60,
              iconUrl: 'assets/item_icon/food_icon.jpg'),
          const CustomCard(
            title: 'Ăn uống',
            des: '150,000 ₫',
            persent: 60,
            iconUrl: 'assets/item_icon/bike.png',
          ),
        ],
      ),
    );
  }

  Widget _grapThang() {
    List<CostData> data = [
      CostData('Tháng trước', 14.5, Colors.blue),
      CostData('Tháng này', 5, Colors.amber)
    ];
    return Center(
      child: Column(
        children: [
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              title: const ChartTitle(
                  text: '2,030,000.00 ₫',
                  textStyle: TextStyle(fontWeight: FontWeight.w500)),
              legend: const Legend(
                isVisible: true,
                position: LegendPosition.top,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<CostData, String>>[
                ColumnSeries<CostData, String>(
                    dataSource: data,
                    animationDuration: 1000,
                    name: "Tổng chi tiêu tháng",
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    xValueMapper: (CostData sales, _) => sales.times,
                    yValueMapper: (CostData sales, _) => sales.prices,
                    pointColorMapper: (CostData sales, _) => sales.colors,
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ]),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Chi tiêu nhiều nhất",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const CustomCard(
              title: 'Ăn uống',
              des: '150,000 ₫',
              persent: 60,
              iconUrl: 'assets/item_icon/food_icon.jpg'),
          const CustomCard(
            title: 'Ăn uống',
            des: '150,000 ₫',
            persent: 60,
            iconUrl: 'assets/item_icon/bike.png',
          ),
        ],
      ),
    );
  }

  Widget _recentTransaction() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const Column(children: [
        CustomCard2(
            title: "Ăn uống",
            des: "10 tháng 1 2024",
            price: 80000,
            iconUrl: 'assets/item_icon/cafe_shop.png'),
        CustomCard2(
            title: "Mua sắm",
            des: "11 tháng 1 2024",
            price: 100000,
            iconUrl: 'assets/item_icon/cart.png'),
      ]),
    );
  }
}
