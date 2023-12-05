import 'package:crypto_teste/screens/wallet_screen.dart';
import 'package:crypto_teste/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/user_helper.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key, this.users,});

  final Users? users;

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
            Column(
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
                  textController: nameController,
                  prefix: const Icon(Icons.person),
                  obscure: false,
                  hint: "User Name",
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: phoneController,
                  prefix: const Icon(Icons.phone),
                  obscure: false,
                  hint: "(11)95555-6987",
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: emailController,
                  keyboardtype: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                  obscure: false,
                  hint: "user@user.com",
                  validator: (text) {
                    if(text!.isEmpty || !text.contains("@")){
                      return "E-mail invalid";
                    }else{
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: confirmEmailController,
                  keyboardtype: TextInputType.emailAddress,
                  prefix: const Icon(Icons.email),
                  obscure: false,
                  hint: "Confirm Email",
                  validator: (text) {
                    if(text!.isEmpty || confirmPasswordController.text != emailController.text){
                      return "E-mail invalid";
                    }else{
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: addressController,
                  hint: "Address",
                  obscure: false,
                  prefix: const Icon(Icons.home),
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: cityController,
                  hint: "City",
                  obscure: false,
                  prefix: const Icon(Icons.home),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(
                      width: 173,
                      child: CustomTextFild(
                        textController: stateController,
                        hint: "State",
                        obscure: false,
                        prefix: const Icon(CupertinoIcons.globe),                      
                      ),
                    ),
                    const SizedBox(width: 14,),
                    SizedBox(
                      width: 173,
                      child: CustomTextFild(
                        textController: countryController,
                        hint: "Country",
                        obscure: false,
                        prefix: const Icon(CupertinoIcons.globe),                      
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: passwordController,
                  hint: "Password",
                  obscure: false,
                  prefix: const Icon(Icons.lock),
                  validator: (text){
                    if(text!.isEmpty || text.length < 6){
                      return "Ivalid password";
                    } else {
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFild(
                  textController: confirmPasswordController,
                  hint: "Confirm password",
                  obscure: false,
                  prefix: const Icon(Icons.lock),
                  validator: (text){
                    if(text!.isEmpty || passwordController.text.length != confirmPasswordController.text.length){
                      return "Ivalid password";
                    } else {
                      return "";
                    }
                  },
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Wallet())
                      );
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
              ],
            ),
          ]
          ),
        ),
      ),
    );
  }
}