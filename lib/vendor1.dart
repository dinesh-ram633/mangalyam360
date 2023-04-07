import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mangalyam360_app/catering.dart';
import 'package:mangalyam360_app/makeup.dart';
import 'package:mangalyam360_app/mehndi.dart';
import 'package:mangalyam360_app/music.dart';
import 'package:mangalyam360_app/pandit.dart';
import 'package:mangalyam360_app/photography.dart';
import 'package:mangalyam360_app/stage.dart';
import 'package:mangalyam360_app/venues.dart';

class Beverages extends StatefulWidget {
  const Beverages({super.key});

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
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
          "Vendors",
          style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column ( children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VenueScreen(),
                          ));
                    },
                    child: Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/images (2).jpg"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 40,
                            child: Text(
                              "Venues",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]))),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotographyScreen(),
                          ));
                    },
                    child: Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/download (6).jpg"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 30,
                            child: Text(
                              "Photography",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]))),
              ),
            ],
          ),
          Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MakeupScreen(),
                            ));
                      },
                      child: Container(
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(children: [
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage(
                                  "assets/download (4).jpg"),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 15,
                              child: Text(
                                "Makeup Artist",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ]))),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CateringScreen(),
                            ));
                      },
                      child: Container(
                          height: 200,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(children: [
                            Center(
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: AssetImage("assets/caterers-narain-caterers-cateringsetup-13_15_422354-166272325996606.jpeg"),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 35,
                              child: Text(
                                "Catering",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          ]))),
                ),
              ],
            ),
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MusicScreen(),
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 25),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage("assets/123.jpg"),
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 20,
                                child: Text(
                                  "DJ & Music \nBand",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ]))),
                  ),
                  SizedBox(
                width: 10,
              ),
                   Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MehndiScreen(),
                          ));
                    },
                    child: Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/download (7).jpg"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 50,
                            child: Text(
                              "Mehndi",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]))),
              ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StageScreen(),
                              ));
                        },
                        child: Container(
                            height: 200,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20,left: 25),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage:
                                      AssetImage("assets/images (1).jpg"),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 20,
                                child: Text(
                                  "Stage Decors",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ]))),
                  ),
                  SizedBox(
                width: 10,
              ),
                   Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PanditScreen(),
                          ));
                    },
                    child: Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(children: [
                          Center(
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage("assets/i1.jpg"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 50,
                            child: Text(
                              "Pandits",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ]))),
              ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ])
          ])
        ]),
      ),
    );
  }
}