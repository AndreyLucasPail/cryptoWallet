import 'package:flutter/material.dart';

class CustomTextFild extends StatelessWidget {
  const CustomTextFild({super.key, this.keyboardtype, this.hint, this.prefix, 
    this.textController, this.obscure});

  final TextEditingController? textController;
  final TextInputType? keyboardtype;
  final String? hint;
  final Widget? prefix;
  final bool? obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(32),
        color: Colors.grey[200]
      ),
      child: Form(
        child: TextFormField(
          keyboardType: keyboardtype,
          obscureText: obscure!,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            prefixIcon: prefix
          ),
        ),
      ),
    );
  }
}