import 'package:crypto_teste/helpers/user_helper.dart';
import 'package:crypto_teste/widgets/user_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key, });

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

  UserHelper helper = UserHelper();

  List<Users> user = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children:[ 
                Container(
                  height: 120,
                  width: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage("assets/homem.png"))
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color:Colors.red,
                    ),
                    child: const Icon(Icons.add, color: Colors.white,size: 20,)
                  ),
                ),
                ]
              ),
              const SizedBox(height: 8,),
              const Text(
                "User Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 5,),
              const Text(
                "User@User.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                ),
              ),
              const SizedBox(height: 16,),
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
              const SizedBox(height: 16,),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Phone number:",
                subtitle: "(51)93640-5507",
                leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Address:",
                subtitle: "Park Avenue",
                leading: Icon(Icons.home, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "City:",
                subtitle: "New York",
                leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "State:",
                subtitle: "NY",
                leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Country:",
                subtitle: "USA",
                leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Date Of Birth:",
                subtitle: "25/09/1996",
                leading: Icon(Icons.cake, color: Colors.grey[900], size: 30,),
              ),
              Container(height: 1, width: 550, color: Colors.black,),
              UserTile(
                title: "Gender:",
                subtitle: "male",
                leading: Icon(Icons.male, color: Colors.grey[900], size: 30,),
              ),
            ],
          ),
        ),
      ]
    );
  }
}