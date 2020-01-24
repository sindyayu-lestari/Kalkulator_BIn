import 'package:flutter/material.dart';
import 'package:kalkulator/Home.dart';
import 'package:kalkulator/Profile.dart';

void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home(),routes: {
      Home.routeName: (ctx) => Home(),
      Profile.routerName: (ctx) => Profile(),
    });
  }
}