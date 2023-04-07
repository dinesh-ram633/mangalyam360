import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/cartprovider.dart';
import 'package:mangalyam360_app/checkout.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cartprovider>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cart [\ RS. ${cart.totalPrice} ]',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600
              )),
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
        ),
        body: cart.basketItems.length == 0
            ? Center(
                child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 100,
                    color: Colors.black54,
                  ),
                  Text(
                    'Your Cart is Empty',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ))
            : ListView.builder(
                itemCount: cart.basketItems.length,
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
                                      cart.basketItems[index].imageURL,
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
                              cart.basketItems[index].Name,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rs ' + cart.basketItems[index].price.toString(),
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20, left: 30),
                          child: IconButton(
                            onPressed: () {
                              cart.remove(
                                cart.basketItems[index],
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
                }),
        floatingActionButton: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.black54),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(),
                  ));
            },
            child: Text(
              "CheckOut  >",
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            )),
      );
    });
  }
}
