import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mangalyam360_app/cart.dart';
import 'package:mangalyam360_app/cartprovider.dart';
import 'package:mangalyam360_app/itemclass.dart';
import 'package:mangalyam360_app/wishlist.dart';
import 'package:mangalyam360_app/wishlistprovider.dart';
import 'package:provider/provider.dart';



class VenueScreen extends StatefulWidget {
  const VenueScreen({super.key});

  @override
  State<VenueScreen> createState() => _VenueScreenState();
}

class _VenueScreenState extends State<VenueScreen> {
  final List<Item> items = [
    Item(
      Name: 'Rina \nVenue',     
      price: 60000,
      imageURL: 'assets/v1.jpg',
    ),
    Item(
      Name: 'Sangam \nHotel ',
      price: 100000,
      imageURL: 'assets/v2.jpg',
    ),
    Item(
      Name: 'Palace \nHouse',
      price: 120000,
      imageURL: 'assets/v3.jpg',
    ),
    Item(
      Name: 'VN \nMahal ',
      price: 80000,
      imageURL: 'assets/v4.jpg',
    ),
    Item(
      Name: 'Nala \nHotel',
      price: 70000,
      imageURL: 'assets/v5.jpg',
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
              "Venues",
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
                          Row(
                            children: [
                              Icon(Icons.people),
                              Text("Min 250",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                          Text(
                            'Rs ' + items[index].price.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
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