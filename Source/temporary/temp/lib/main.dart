import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/named/first_named.dart';
import 'package:temp/named/second_named.dart';
import 'package:temp/src/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const Home(),
      initialRoute: "/",
      routes: {
        "/" : (context)=> const Home(),
        "/first" : (context)=> const FirstNamedPage(),
        "/second" : (context)=> const SecondNamedPage(),
      },
      getPages: [
        GetPage(name: "/", page: ()=> const Home()),
        GetPage(name: "/first", page: ()=> const FirstNamedPage()),
        GetPage(name: "/second", page: ()=> const SecondNamedPage()),
      ],
    );
  }
}
