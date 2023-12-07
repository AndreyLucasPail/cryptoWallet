import 'package:crypto_teste/screens/login_screen.dart';
import 'package:crypto_teste/screens/wallet_screen.dart';
import 'package:crypto_teste/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/user_helper.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key,});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {

  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final birthdayController =TextEditingController();

  UserHelper helper = UserHelper();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    helper.initDb();
  }

  @override
  Widget build(BuildContext context) {
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
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))
          ),
          toolbarHeight: 130,
          elevation: 6,
          centerTitle: true,
          title: const Text(
            "Sing Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: ListView(
            children:[ 
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/eleitor.png"),
                  ),
                  const SizedBox(height: 18,),
                  CustomTextFild(
                    labalText: "User",
                    textController: nameController,
                    prefix: const Icon(Icons.person),
                    obscure: false,
                    hint: "User Name",
                    validator: validateName
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "Phone",
                    textController: phoneController,
                    prefix: const Icon(Icons.phone),
                    obscure: false,
                    hint: "(11)95555-6987",
                    keyboardtype: TextInputType.phone,
                    validator: validatePhone
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "E-mail",
                    textController: emailController,
                    keyboardtype: TextInputType.emailAddress,
                    prefix: const Icon(Icons.email),
                    obscure: false,
                    hint: "user@user.com",
                    validator: validateEmail
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "Confirm Email",
                    textController: confirmEmailController,
                    keyboardtype: TextInputType.emailAddress,
                    prefix: const Icon(Icons.email),
                    obscure: false,
                    hint: "Confirm Email",
                    validator: validateConfirmEmail
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "Address",
                    textController: addressController,
                    hint: "Address",
                    obscure: false,
                    prefix: const Icon(Icons.home),
                    validator: validateAddress
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 173,
                        child: CustomTextFild(
                          labalText: "Birthday",
                          textController: birthdayController,
                          hint: "01/01/2023",
                          obscure: false,
                          prefix: const Icon(Icons.cake_rounded),  
                          validator: validateBirthday 
                        ),
                      ),
                      const SizedBox(width: 14,),
                      SizedBox(
                        width: 173,
                        child: CustomTextFild(
                          labalText: "City",
                          textController: cityController,
                          hint: "New York",
                          obscure: false,
                          prefix: const Icon(CupertinoIcons.globe), 
                          validator: validateCity                     
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 173,
                        child: CustomTextFild(
                          labalText: "State",
                          textController: stateController,
                          hint: "NY",
                          obscure: false,
                          prefix: const Icon(CupertinoIcons.globe), 
                          validator: validateState,                     
                        ),
                      ),
                      const SizedBox(width: 14,),
                      SizedBox(
                        width: 173,
                        child: CustomTextFild(
                          labalText: "Country",
                          textController: countryController,
                          hint: "USA",
                          obscure: false,
                          prefix: const Icon(CupertinoIcons.globe),
                          validator: validateCountry,                      
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "Password",
                    textController: passwordController,
                    hint: "Password",
                    obscure: true,
                    prefix: const Icon(Icons.lock),
                    validator: validatePassword,
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFild(
                    labalText: "Confirm password",
                    textController: confirmPasswordController,
                    hint: "Confirm password",
                    obscure: true,
                    prefix: const Icon(Icons.lock),
                    validator: validateConfirmPassword,
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LoginScreen())
                      );
                    }, 
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400, 
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                    child: SizedBox(
                      height: 45,
                      width: 250,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            addUser();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Wallet())
                            );
                          }
                        }, 
                        child: const Text(
                          "finalize registration", 
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]
          ),
        ),
      ),
    );
  }

  
  String? validateName(String? text) {
    if (text == null || text.isEmpty) {
      return "Please enter some text";
    }
    return null;
  }

  String? validatePhone(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your phone number";
    }
    return null;
  }

  String? validateEmail(String? text) {
    if (text == null || text.isEmpty || !text.contains("@")) {
      return "E-mail invalid";
    }
    return null;
  }

  String? validateConfirmEmail(String? text) {
    if (text == null || text.isEmpty || emailController.text != text) {
      return "E-mail does not match";
    }
    return null;
  }

  String? validateAddress(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your address";
    }
    return null;
  }

  String? validateBirthday(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your birth date";
    }
    return null;
  }

  String? validateCity(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your city";
    }
    return null;
  }

  String? validateState(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your state";
    }
    return null;
  }

  String? validateCountry(String? text) {
    if (text == null || text.isEmpty) {
      return "enter your country";
    }
    return null;
  }

  String? validatePassword(String? text) {
    if (text == null || text.isEmpty || text.length < 6) {
      return "Invalid password";
    }
    return null;
  }

  String? validateConfirmPassword(String? text) {
    if (text == null || text.isEmpty || passwordController.text != confirmPasswordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void addUser() async {
    Users users = Users(
      username: nameController.text,
      phone: phoneController.text, 
      email: emailController.text,
      confirmEmail: confirmEmailController.text,
      img: "assets/homem.png",
      address: addressController.text,
      birthday: birthdayController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      city: cityController.text,
      state: stateController.text,
      country: countryController.text,
    );
    await helper.saveUser(users);
  }
}