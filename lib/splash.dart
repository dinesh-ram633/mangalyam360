import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [Image.asset("assets/WhatsApp Image 2022-04-17 at 16.28.21.jpeg",
              fit: BoxFit.fill,
              height: 716,
              width: 390,
          ),
              //  Positioned(
              //   bottom: 120,
              //   left: 70,
              //   child: Text(
              //     'Carsbee',
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 20, 20, 20),
              //         fontWeight: FontWeight.w700,
              //         fontSize: 75),
              //                ),
              //  ),
              SizedBox(
                height: 20,
              ),
              ]),
             
              // CircularProgressIndicator(
              //   color: Colors.black54,
              // )
            ],
          ),
        ),
      ),
    );
  }
}