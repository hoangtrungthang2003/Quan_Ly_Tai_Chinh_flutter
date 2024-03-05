import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/widgets/budget_page/pricePoints.dart';

class CustomLineChart extends StatelessWidget {
  final List<PricePoint> points;

  const CustomLineChart(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
              isCurved: false,
              dotData: const FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
