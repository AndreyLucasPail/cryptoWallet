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
  
  late Users users;

  @override
  void initState() {
    super.initState();

    helper.getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Users>>(
      future: helper.getAllUsers(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.hasError){
          return const Center(
            child: Text(
              "ERROR!!",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
          );
        }else{
          List<Users>? list = snapshot.data;
          return ListView(
            children: list!.map((e) {
              return Container(
                margin: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children:[ 
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(e.img))
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
                    Text(
                      e.username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      e.email,
                      style: const TextStyle(
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
                      subtitle: e.phone,
                      leading: Icon(Icons.phone, color: Colors.grey[900], size: 30,),
                    ),
                    Container(height: 1, width: 550, color: Colors.black,),
                    UserTile(
                      title: "Address:",
                      subtitle: e.address,
                      leading: Icon(Icons.home, color: Colors.grey[900], size: 30,),
                    ),
                    Container(height: 1, width: 550, color: Colors.black,),
                    UserTile(
                      title: "City:",
                      subtitle: e.city,
                      leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
                    ),
                    Container(height: 1, width: 550, color: Colors.black,),
                    UserTile(
                      title: "State:",
                      subtitle: e.state,
                      leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
                    ),
                    Container(height: 1, width: 550, color: Colors.black,),
                    UserTile(
                      title: "Country:",
                      subtitle: e.country,
                      leading: Icon(CupertinoIcons.globe, color: Colors.grey[900], size: 30,),
                    ),
                    Container(height: 1, width: 550, color: Colors.black,),
                    UserTile(
                      title: "Date Of Birth:",
                      subtitle: e.birthday,
                      leading: Icon(Icons.cake, color: Colors.grey[900], size: 30,),
                    ),
                  ],
                ),
              );
            }).toList()              
          );
        }
      },
    );
  }
}