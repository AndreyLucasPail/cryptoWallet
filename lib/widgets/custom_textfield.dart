import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({super.key, this.keyboardtype, this.hint, this.prefix, 
    this.textController, this.obscure, this.validator, required this.labalText});

  final TextEditingController? textController;
  final TextInputType? keyboardtype;
  final String? hint;
  final Widget? prefix;
  final bool? obscure;
  final String labalText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      controller: textController,
      validator: validator,
      keyboardType: keyboardtype,
      obscureText: obscure!,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white60,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
        ),
        prefixIcon: prefix,
        prefixIconColor: Colors.grey[700]
      ),
    );
  }
}