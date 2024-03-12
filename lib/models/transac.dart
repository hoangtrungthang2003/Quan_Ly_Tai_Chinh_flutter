import 'package:uuid/uuid.dart';

class Transac {
  Transac({

    required this.image,
    required this.name,
    required this.amount,
    required this.createdAt,
    required this.uid,
    required this.wid,
  }) : id = const Uuid().v4();
  late String image;
  late String name;
  late double amount;
  late String id;
  late String uid;
  late String wid;
  late String createdAt;

  Transac.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    amount = json['amount'] ?? '';
    id = json['id'];
    uid = json['uid'];
    wid = json['wid'];
    createdAt = json['created_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['amount'] = amount;
    data['id'] = id;
    data['uid'] = uid;
    data['wid'] = wid;
    data['created_at'] = createdAt;
    return data;
  }
}
