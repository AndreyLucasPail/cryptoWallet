import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, this.title, this.leading, this.subtitle});

  final String? title;
  final Widget? leading;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
      leading: leading,
      subtitle: Text(
        subtitle!,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}