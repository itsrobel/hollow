import 'package:flutter/material.dart';
import 'package:flutter_custom_drawer/screen/login.dart';

void main() {
  //runApp(MyApp());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
