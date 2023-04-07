import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentScreen extends StatefulWidget {
  final double totalPrice;
  const PaymentScreen({super.key, required this.totalPrice});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;
  TextEditingController textEditingController = TextEditingController();

  get totalPrice => null;

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_F9Jzc1xWmHg2z9',
      'amount': num.parse(textEditingController.text) * 100,
      'name': 'Food App',
      'description': 'Booking',
      'timeout': 300,
      'prefill': {'contact': '9751671972', 'email': 'poojasomu1515@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment success");
    Fluttertoast.showToast(msg: "Payment Success");
  }

  void handlerErrorFailure() {
    print("payment Failed");
    Fluttertoast.showToast(msg: "Payment Failed");
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Fluttertoast.showToast(msg: "External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Payment",
          style:
              TextStyle(color: Colors.black, fontSize: 24),
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
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Total Price: Rs. ${(widget.totalPrice * 1.05).toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Amount",
                    hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    filled: true,
                    fillColor: Color.fromARGB(255, 200, 199, 199)),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54),
                  onPressed: () {
                    openCheckout();
                  },
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20),
                  )),
            ],
          )),
    );
  }
}
