import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';

void main() {
  //ApiService().getTodaysToons();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}



