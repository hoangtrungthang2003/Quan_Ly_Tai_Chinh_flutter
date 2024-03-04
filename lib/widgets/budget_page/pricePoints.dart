import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

class PricePoint {
  final double x;
  final double y;
  PricePoint({required this.x, required this.y});
}

List<PricePoint> get pricePoints {
  final data = <double>[0, 5, 4, 15, 20, 10];
  return data
      .mapIndexed(
          ((index, Element) => PricePoint(x: index.toDouble(), y: Element)))
      .toList();
}
