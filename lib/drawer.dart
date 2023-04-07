import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mangalyam360_app/bottomnav.dart';
import 'package:mangalyam360_app/home.dart';
import 'package:mangalyam360_app/profile.dart';
import 'package:mangalyam360_app/signin.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
       child: ListView(
        children: [
                    UserAccountsDrawerHeader(
          accountName:Text("Dineshram",style: TextStyle(color: Colors.black,fontSize: 20),) , accountEmail: Text("dram@gmail.com",style: TextStyle(color: Colors.black,fontSize: 20),),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network("https://www.shutterstock.com/image-vector/man-character-face-avatar-glasses-260nw-562077406.jpg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/download (2).jpg"),
            fit: BoxFit.cover
            )
          ),
          ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("profile"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileNav(),));
              },
            ),
             ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
              },),
               ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
              },),
              ListTile(
              leading: Icon(Icons.share),
              title: Text("Share"),
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(),));
              },),
               ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
              },),
        ],
      ),
    );
  }
}