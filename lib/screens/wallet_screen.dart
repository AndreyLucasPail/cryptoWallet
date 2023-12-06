import 'package:crypto_teste/helpers/user_helper.dart';
import 'package:crypto_teste/screens/login_screen.dart';
import 'package:crypto_teste/screens/wallet_card_screen.dart';
import 'package:crypto_teste/screens/wallet_my_account_screen.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key, this.users});

  final Users? users;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  
  int? page = 1;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

      PageController? pageController = PageController();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255,0, 4, 40),
            Color.fromARGB(255, 0, 78, 146)
          ]
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 57, 107),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          elevation: 6,
          centerTitle: true,
          toolbarHeight: 180,
          title: const Column(
            children: [
              Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: 16,),
              Text(
                "\$ 28,565,000",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.notifications, size: 30,)
            ),
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                }, 
                icon: const Icon(Icons.exit_to_app, size: 30,)
              );
            }
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 0, 78, 146),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          currentIndex: page!,
          onTap: (value) {
            pageController.animateToPage(
              value, 
              duration: const Duration(milliseconds: 500), 
              curve: Curves.ease
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white,),
              label: "Market",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.white,),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white,),
              label: "My account",
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          children: [
            const WalletCard(), 
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.orange,
                    Color.fromARGB(255, 0, 78, 146)
                  ], 
                ),
              ),
            ),
            const MyAccountScreen(),   
          ]
        ),
      ),
    );
  }
}