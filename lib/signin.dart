import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/auth.dart';
import 'package:mangalyam360_app/bottomnav.dart';
import 'package:mangalyam360_app/color.dart';
import 'package:mangalyam360_app/constants.dart';
import 'package:mangalyam360_app/home.dart';
import 'package:mangalyam360_app/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = new TextEditingController();

  final TextEditingController passwordcontroller = new TextEditingController();

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
             child: Text(appName,style: TextStyle(
                fontSize: 25,fontWeight: FontWeight.w700
                ),),
           ),
            Center(child: Text(slogan,style: TextStyle(color: Colors.grey),)),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Container(
                child: Text(
                  "  $loginString  ",
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
                  controller: emailcontroller,
          keyboardType: TextInputType.emailAddress,
          
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Email");
            }
            return null;
          },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.email,color: primarycolor,),
                    labelText: "EMAIL ADDRESS",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Form(
                child: TextFormField(
                  controller: passwordcontroller,
          obscureText: true,
          validator: (value) {
            RegExp regex = new RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("Password is required for login");
            }
            if (!regex.hasMatch(value)) {
              return ("Please Enter valid Password(Min. 6 character)");
            }
          },
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    ) ,
                    prefixIcon: Icon(Icons.lock_open,color: primarycolor,),
                    labelText: "PASSWORD",labelStyle: TextStyle(color: primarycolor,fontSize: 16)
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (() {
                
              }), child: Text("Forget Password?",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            Center(
              child: SizedBox(
                height: height*0.08,
                width: width - 30,
                child: MaterialButton(
                  color: primarycolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  onPressed: (() async{
                    await Authenticationservice(FirebaseAuth.instance)
              .firebaseLogin(
                  emailcontroller.text.trim(), passwordcontroller.text.trim())
              .then((value) {
            if (value == "signed in") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigation(),
                  ));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("please Enter Your Email")));
            }
          });
                  
                }), child: Text("Login",
                style: TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.w500,fontSize: 22,color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text("Dont have an account?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
            }), child: Text("Create Account",style: TextStyle(color: Colors.white,fontSize: 16),))
              ],
            ),
             ],
        ),
      ),
    );
  }
}