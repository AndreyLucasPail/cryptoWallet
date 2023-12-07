import 'package:crypto_teste/screens/singup_screen.dart';
import 'package:crypto_teste/screens/wallet_screen.dart';
import 'package:crypto_teste/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.emailController, this.passwordController});

  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255,0, 4, 40),
              Color.fromARGB(255, 0, 78, 146)
            ], 
          ),
        ),
        child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(32),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Crypto",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      letterSpacing: 1
                    ),
                  ),
                  const Text(
                    "Manage all your funds",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  CustomTextFild(
                    labalText: "E-mail",
                    textController: emailController,
                    obscure: false,
                    hint: "E-mail",
                    prefix: const Icon(Icons.account_circle),
                    keyboardtype: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20,),
                  CustomTextFild(
                    labalText: "password",
                    textController: passwordController,
                    obscure: true,
                    hint: "Password",
                    prefix: const Icon(Icons.lock),
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder()
                      ),
                      onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => const Wallet())
                          );
                      },
                      child: const Text(
                        "Sing in",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 01,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const StadiumBorder()
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SingUpScreen())
                        );
                      },
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}