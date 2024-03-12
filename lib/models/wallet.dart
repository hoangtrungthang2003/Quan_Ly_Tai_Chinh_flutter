import 'package:uuid/uuid.dart';

class Wallet {
  Wallet({
    required this.image,
    required this.name,
    required this.amount,
    required this.selected,
    required this.createdAt,
  }) : id = const Uuid().v4();
  late String image;
  late String name;
  late bool selected;
  late double amount;
  late String id;
  late String createdAt;

  Wallet.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    amount = json['amount'] ?? '';
    id = json['id'];
    selected = json['selected'];
    createdAt = json['created_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['amount'] = amount;
    data['id'] = id;
    data['selected'] = selected;
    data['created_at'] = createdAt;
    return data;
  }
}
