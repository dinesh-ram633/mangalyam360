import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mangalyam360_app/cart.dart';
import 'package:mangalyam360_app/cartprovider.dart';
import 'package:mangalyam360_app/itemclass.dart';
import 'package:mangalyam360_app/wishlist.dart';
import 'package:mangalyam360_app/wishlistprovider.dart';
import 'package:provider/provider.dart';



class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  final List<Item> items = [
    Item(
      Name: 'Dj Sunny',
      price: 3000,
      imageURL: 'assets/d1.jpg',
    ),
    Item(
      Name: 'Music \nHouse',
      price: 4000,
      imageURL: 'assets/d2.jpg',
    ),
    Item(
      Name: 'The Fab \nCrew',
      price: 5500,
      imageURL: 'assets/d3.jpg',
    ),
    Item(
      Name: 'Askew \nEvents',
      price: 8000,
      imageURL: 'assets/d4.jpg',
    ),
    Item(
      Name: 'Dj Alex',
      price: 3500,
      imageURL: 'assets/d5.jpg',
    )
  ];

 @override
  Widget build(BuildContext context) {
    return Consumer<wishlistprovider>(builder: (context, wishlist, child) {
      return Consumer<cartprovider>(builder: (context, Cart, child) {
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
              "Dj & Music Band",
              style: TextStyle(
                  fontSize: 22, color: Colors.black),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WishlistScreen()));
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartScreen()));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: ((context, index) {
                return Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 180,
                          width: 150,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                    items[index].imageURL,
                                  ),
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            items[index].Name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Text(
                              'Rs ' + items[index].price.toStringAsFixed(0)+'/hour',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black54),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )),
                              ),
                              onPressed: () {
                                Cart.add(items[index]);
                              },
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 130, left: 30),
                        child: IconButton(
                          onPressed: () {
                            wishlist.add(
                              items[index],
                            );
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                          ),
                          iconSize: 40,
                        ),
                      ),
                    ],
                  ),
                ]);
              }),
            ),
          ),
        );
      });
    });
  }
}