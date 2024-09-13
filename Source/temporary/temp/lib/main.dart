import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/argument/first_argument.dart';
import 'package:temp/pages/named/first_named.dart';
import 'package:temp/pages/named/second_named.dart';
import 'package:temp/pages/userpage/user_page.dart';
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
      // routes: {
      //   "/" : (context)=> const Home(),
      //   "/first" : (context)=> const FirstNamedPage(),
      //   "/second" : (context)=> const SecondNamedPage(),
      // },
      getPages: [
        GetPage(name: "/", page: ()=> const Home(),transition: Transition.rightToLeftWithFade),
        GetPage(name: "/first", page: ()=> const FirstNamedPage(),transition: Transition.rightToLeftWithFade),
        GetPage(name: "/second", page: ()=> const SecondNamedPage(),transition: Transition.rightToLeftWithFade),
        GetPage(name: "/next", page: ()=> const FirstArgument(),transition: Transition.rightToLeftWithFade),
        GetPage(name: "/user/:uid", page: ()=> const UserPage(),transition: Transition.rightToLeftWithFade),
      ],
    );
  }
}
