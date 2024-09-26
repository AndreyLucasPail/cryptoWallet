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
  UserHelper helper = UserHelper();

  @override
  void initState() {
    super.initState();
  }

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 4, 40),
              Color.fromARGB(255, 0, 78, 146)
            ]),
      ),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 1, 57, 107),
          iconTheme: const IconThemeData(color: Colors.white),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
          elevation: 6,
          centerTitle: true,
          toolbarHeight: 180,
          title: const Column(
            children: [
              Text(
                "Wallet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "\$ 28,565,000",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ],
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () async {
                  Users? loggedUser = await helper.getLoggedUser();

                  if (loggedUser != null) {
                    int? userId = loggedUser.id;
                    print("UserID: $userId");

                    helper.logoutUser(userId);
                    setState(() {
                      isLoggedIn = false;
                    });
                  }

                  Navigator.of(scaffoldKey.currentContext!).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
              );
            },
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
              curve: Curves.ease,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Market",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet,
                color: Colors.white,
              ),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
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
                    Color.fromARGB(255, 0, 78, 146),
                  ],
                ),
              ),
            ),
            const MyAccountScreen(),
          ],
        ),
      ),
    );
  }
}
