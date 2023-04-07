import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class sliderwidget extends StatelessWidget {
  const sliderwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
    items: [
      GestureDetector(
        onTap: () {
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 24),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage('assets/caterers-narain-caterers-cateringsetup-13_15_422354-166272325996606.jpeg'),
                  fit: BoxFit.cover)
              ),
            
            ),
            Positioned(
              top: 0,
              left: 95,
              bottom: 10,
              child: Text("Catering",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
      
      GestureDetector(
        onTap: () {
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 24),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage('assets/images (1).jpg'),
                  fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 0,
              left: 85,
              child: Text("Stage Decors",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 24),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage('assets/download (4).jpg'),
                  fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: 0,
              left: 85,
            
              child: Text("Bridal Makeup",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, bottom: 24),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image: AssetImage('assets/download (6).jpg'),
                  fit: BoxFit.cover)
              ),
            ),
            Positioned(
              top: -2,
              left: 85,
              
              child: Text("Photography",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    ], 
    options: CarouselOptions(
      enlargeCenterPage: true,
      autoPlay: true,
    ));
  }
}