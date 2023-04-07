
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mangalyam360_app/bottomnav.dart';
import 'package:mangalyam360_app/cartprovider.dart';
import 'package:mangalyam360_app/signin.dart';
import 'package:mangalyam360_app/splash.dart';
import 'package:mangalyam360_app/wishlistprovider.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
      providers: [
        ChangeNotifierProvider<wishlistprovider>(
          create: (_) => wishlistprovider(),
        ),
        
        ChangeNotifierProvider<cartprovider>(
          create: (_) => cartprovider(),
        ),
      ],
      child :
     MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
       ) );
       }
}
