import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/auth.dart';
import 'package:mangalyam360_app/color.dart';
import 'package:mangalyam360_app/constants.dart';
import 'package:mangalyam360_app/signin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({ Key? key }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();

  final NameEditingcontroller = new TextEditingController();
  final emailEditingcontroller = new TextEditingController();
  final passwordEditingcontroller = new TextEditingController();
  final confirmpasswordEditingcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Stack(
            children: [
             Image.asset(bgImage,
            height: height * 0.42 ,
            width: width ,
            fit: BoxFit.cover,
            ),  
            Container(
              height: height *0.42,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  stops: [0.3,0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:[
                  Colors.transparent,
                  Colors.white,
                ])
              ),
             ),
            ],
          ),
           Center(
             child: Text("Create Account",style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.w700
                ),),
           ),
            Center(child: Text(slogan,style: TextStyle(color: Colors.grey),)),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 10),
              child: Container(
                child: Text(
                  "  Signup  ",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors:[
                   primarycolor.withOpacity(0.3),Colors.transparent
                  ],),
                  border: Border(left: BorderSide(color: primarycolor,width: 5))
                ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                child: TextFormField(
                  controller: NameEditingcontroller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.person,color: primarycolor,),
                    labelText: "Name",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                child: TextFormField(
                  controller: emailEditingcontroller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.mail,color: primarycolor,),
                    labelText: "Email",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                child: TextFormField(
                  controller: passwordEditingcontroller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.lock_open,color: primarycolor,),
                    labelText: "Password",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                child: TextFormField(
                  controller: confirmpasswordEditingcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.lock_open,color: primarycolor,),
                    labelText: "Confirm Password",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
          
            Center(
              child: SizedBox(
                height: height*0.06,
                width: width - 150,
                child: MaterialButton(
                  color: primarycolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: (() async {
                 await Authenticationservice(FirebaseAuth.instance)
              .firebaseregister(emailEditingcontroller.text.trim(),
                  passwordEditingcontroller.text.trim())
              .then((value) {
            if (value == "signed up") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please Enter Your Email")));
            }
          });
                }), child: Text("Signup",
                style: TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),
                )),
              ),
            ),
            
             ],
        ),
      ),
    );
  }
}