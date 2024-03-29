import 'package:flutter/material.dart';
import 'package:flutter_quan_li_tai_chinh/apis/APIs.dart';
import 'package:flutter_quan_li_tai_chinh/models/wallet.dart';
import 'package:flutter_quan_li_tai_chinh/screens/Page_budget.dart';
import 'package:flutter_quan_li_tai_chinh/screens/account_page.dart';
import 'package:flutter_quan_li_tai_chinh/screens/account_screen.dart';
import 'package:flutter_quan_li_tai_chinh/screens/add_transaction_screen.dart';
import 'package:flutter_quan_li_tai_chinh/screens/home_screen.dart';
import 'package:flutter_quan_li_tai_chinh/screens/list_transaction_screen.dart';
import 'package:flutter_quan_li_tai_chinh/screens/transaction_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  Wallet? wallet;

  @override
  void initState() {
    super.initState();
    loadWalletData();
  }

  Future<void> loadWalletData() async {
    Wallet? fetchedWallet = await APIs.getWallet(APIs.user.uid);
    setState(() {
      wallet = fetchedWallet;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      wallet == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : HomeScreen(wallet: wallet!),
      wallet == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : TransactionScreen(wallet: wallet!),
      wallet == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : AddTransaction(wallet: wallet!),
      // Icon(Icons.pending_actions_sharp),
      // ChooseItemScreen(),
       Budget(),
      const account(),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 239, 255),
      body: SafeArea(
        child: Center(
          child: body[_currentIndex],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Tổng quan',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Giao dịch',
                icon: Icon(Icons.account_balance_wallet),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SizedBox.shrink(), // Empty container for the center space
              ),
              BottomNavigationBarItem(
                label: 'Ngân sách',
                icon: Icon(Icons.pending_actions_sharp),
              ),
              BottomNavigationBarItem(
                label: 'Tài khoản',
                icon: Icon(Icons.person),
              ),
            ],
          ),
          Positioned(
            top: 3,
            left: MediaQuery.of(context).size.width / 2 - 23.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
