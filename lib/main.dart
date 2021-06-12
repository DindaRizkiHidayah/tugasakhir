import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugasakhir/pages/drawernav.dart';
import 'package:tugasakhir/pages/home.dart';
import 'package:tugasakhir/pages/homePenjualan.dart';
import 'package:tugasakhir/pages/login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}