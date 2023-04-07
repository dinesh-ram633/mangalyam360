import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mangalyam360_app/color.dart';
import 'package:mangalyam360_app/drawer.dart';
import 'package:mangalyam360_app/slider.dart';
import 'package:mangalyam360_app/vendor1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final _formKey = GlobalKey<FormState>();
  late String _eventType;
  late int _numGuests;
  late String _location;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text("Mangalyam360",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9.0,
                        ),
                        width: size.width * .91,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5,),
                            const Expanded(
                                child: TextField(
                              showCursor: true,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(fontSize: 18,color: Colors.black54),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            )),
                            Icon(
                              Icons.mic,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )
                    ],
                  ),
                   ),SizedBox(height: 5,),
                Text(
                  'Top Vendors for you',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),   
              SizedBox(height: 10,),
              sliderwidget(),
              SizedBox(height: 5,),
                Text(
                  'Tell us about your event',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Event Type',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter event type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _eventType = value!;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of Guests',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter number of guests';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _numGuests = int.tryParse(value!)!;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
                SizedBox(height: 12.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primarycolor
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Beverages(),));
                    }
                  },
                  child: Text('Submit',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}