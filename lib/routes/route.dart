import 'package:core_flutter_exam/Screens/AddScreen.dart';
import 'package:core_flutter_exam/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context)=>HomePage(),
    '/add':(context) =>AddScreen(),
  };
}