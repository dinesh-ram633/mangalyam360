import 'package:flutter/material.dart';
import 'package:mangalyam360_app/cartprovider.dart';
import 'package:mangalyam360_app/payment.dart';
import 'package:provider/provider.dart';


class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<cartprovider>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "CheckOut",
              style: TextStyle(color: Colors.black),
            ),
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
          body: Column(
            children: [
              Expanded(
                  child: cart.basketItems.length > 0
                      ? ListView.builder(
                          itemCount: cart.basketItems.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      height: 150,
                                      width: 120,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                cart.basketItems[index]
                                                    .imageURL,
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
                                        'Rs ' +
                                            cart.basketItems[index].price
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20, left: 30),
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
                          })
                      : Column(children: [
                          Image(
                            image: AssetImage(
                              "asset/empty.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'No items yet to place the Order',
                            style: TextStyle(color: Colors.black,fontSize: 20),
                          ),
                        ])),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    SizedBox(height: 20),
                    Text(
                      'Service Tax:',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rs. ${cart.totalPrice * 0.05}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Text(
                          'Rs. ${(cart.totalPrice * 1.05).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black54),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaymentScreen(totalPrice: cart.totalPrice)));
                    },
                    child: Text(
                      "Order Now   >",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}
