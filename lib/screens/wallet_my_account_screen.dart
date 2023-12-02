import 'package:crypto_teste/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCard(
          text: "Profile",
          iconData: Icons.person_outlined,
          onTap: () {
            
          },
        ),
        CustomCard(
          text: "Profile",
          iconData: Icons.person_outlined,
          onTap: () {
            
          },
        ),
        CustomCard(
          text: "Profile",
          iconData: Icons.person_outlined,
          onTap: () {
            
          },
        ),
        CustomCard(
          text: "Profile",
          iconData: Icons.person_outlined,
          onTap: () {
            
          },
        ),
        CustomCard(
          text: "Profile",
          iconData: Icons.person_outlined,
          onTap: () {
            
          },
        ),
      ],
    );
  }
}