import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/wishlistprovider.dart';
import 'package:provider/provider.dart';


class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<wishlistprovider>(
      builder: (context, wishlist, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: (() {
                    Navigator.pop(context);
                  }),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 30,
                  )),
              title: Text(
                "WishList",
                style: TextStyle(
                    fontSize: 22, color: Colors.black),
              ),
            ),
            body: wishlist.wishItems.length == 0
                ? Center(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Icon(
                        Icons.favorite,
                        size: 100,
                        color: Colors.pink,
                      ),
                      Text(
                        'Your WishList is Empty',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ))
                : ListView.builder(
                    itemCount: wishlist.wishItems.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SizedBox(
                                height: 150,
                                width: 120,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          wishlist.wishItems[index].imageURL,
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Text(
                                  wishlist.wishItems[index].Name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Rs ' +
                                      wishlist.wishItems[index].price
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                           Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 30),
                          child: IconButton(
                            onPressed: () {
                              wishlist.remove(
                                wishlist.wishItems[index],
                              );
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.black54,
                            ),
                            iconSize: 40,
                          ),
                        ),
                          ],
                        ),
                      ]);
                    },
                  ));
      },
    );
  }
}
