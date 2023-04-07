import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/cart.dart';
import 'package:mangalyam360_app/einvite.dart';
import 'package:mangalyam360_app/home.dart';
import 'package:mangalyam360_app/ideas.dart';
import 'package:mangalyam360_app/vendor.dart';
import 'package:mangalyam360_app/vendor1.dart';
import 'package:mangalyam360_app/wishlist.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomeScreen(),
      Beverages(),
      WishlistScreen(),
      CartScreen(),
    ];
  }

  //List of the pages icons

  List<IconData> iconList = [
    Icons.home,
    Icons.view_agenda_outlined,
    Icons.favorite,
    Icons.shopping_cart,
  ];

  // List of the pages titles

  List<String> titleList = [
    "Home",
    'Favorite',
    'Cart',
    'Menu'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: IndexedStack(
      index: _bottomNavIndex,
      children: _widgetOptions(),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBottomNavigationBar(
          splashColor: Colors.black,
          activeColor: Colors.black,
          inactiveColor: Colors.black.withOpacity(.5),
          icons: iconList,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index){
            setState(() {
              _bottomNavIndex = index;
            });
          }
        ),
        // Text(
        //   titleList[_bottomNavIndex],
        //   style: TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        // Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(right: 20,left: 30 ),
        //       child: Text("Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Vendors",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("E-invites",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text("Ideas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        //     )
        //   ],
        // ),
      ],
    ),
  );
    // return Scaffold(
    //   body: IndexedStack(
    //     index: _bottomNavIndex,
    //     children: _widgetOptions(),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   bottomNavigationBar: AnimatedBottomNavigationBar(
    //     splashColor: Colors.black,
    //     activeColor: Colors.black,
    //     inactiveColor: Colors.black.withOpacity(.5),
    //     icons: iconList,
    //     activeIndex: _bottomNavIndex,
    //     gapLocation: GapLocation.none,
    //     notchSmoothness: NotchSmoothness.softEdge,
    //     onTap: (index){
    //       setState(() {
    //         _bottomNavIndex = index;
    //       });
    //     }
    //   ),
    // );
  }
}