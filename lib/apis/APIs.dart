import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_quan_li_tai_chinh/models/transac.dart';
import 'package:flutter_quan_li_tai_chinh/models/user.dart';
import 'package:flutter_quan_li_tai_chinh/models/wallet.dart';

class APIs {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static late Wallet wallet;
  static late Transac tran;
  static late MyUser me;
  static get user => auth.currentUser!;

  static Future<void> createUser() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final myUser = MyUser(
      image: user.photoURL.toString(),
      name: user.displayName.toString(),
      id: user.uid,
      email: user.email.toString(),
    );
    return await firestore
        .collection('users')
        .doc(user.uid)
        .set(myUser.toJson());
  }

  static Future<void> createWallet() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final wallet = Wallet(
      image: 'assets/wallet_icon/savings-icon.png',
      name: 'Ví tiết kiệm',
      amount: 1000000,
      createdAt: time,
      selected: true,
    );
    return await firestore
        .collection('users')
        .doc(user.uid)
        .collection('wallets')
        .doc(wallet.id)
        .set(wallet.toJson());
  }

  static Future<void> addTransaction(Wallet? walletSelected, String? image,
      String? name, double? amount) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    final tran = Transac(
      image: image ?? '',
      name: name ?? '',
      amount: amount ?? 0.0,
      createdAt: time,
      uid: user.id,
      wid: walletSelected?.id ??
          "", // Sử dụng ?. để tránh lỗi nếu walletSelected là null
    );

    return await firestore
        .collection('transactions')
        .doc(tran.id)
        .set(tran.toJson());
  }

  static Future<Wallet?> getWallet(String uid) async {
    try {
      QuerySnapshot walletQuery = await firestore
          .collection('users')
          .doc(uid)
          .collection('wallets')
          .where('selected', isEqualTo: true)
          .limit(1) // Assuming you only want one selected wallet
          .get();

      if (walletQuery.docs.isNotEmpty) {
        DocumentSnapshot walletSnapshot = walletQuery.docs.first;
        Map<String, dynamic>? walletData =
            walletSnapshot.data() as Map<String, dynamic>?;
        if (walletData != null) {
          Wallet wallet = Wallet.fromJson(walletData);
          return wallet;
        }
      }

      return null; // Return null if there is no selected wallet or there was an issue.
    } catch (e) {
      print('Error getting selected wallet data: $e');
      return null;
    }
  }
}
