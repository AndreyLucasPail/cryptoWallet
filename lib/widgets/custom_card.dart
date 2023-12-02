import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, this.onTap, this.text, this.iconData});

  final Function()? onTap;
  final String? text;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  iconData!,
                  size: 60,
                  color: Colors.white,
                  ),
                Text(
                  text!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                const Icon(
                  Icons.arrow_right, 
                  color: Colors.white,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}