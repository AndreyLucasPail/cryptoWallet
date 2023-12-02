import 'package:crypto_teste/widgets/user_tile.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
              ),
              const Text(
                "User Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const Text(
                "User@User.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                ),
              ),
              SizedBox(
                height: 45,
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: (){}, 
                  child: const Text(
                    "Edit Profile >",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
            ],
          ),
        ),
      ]
    );
  }
}