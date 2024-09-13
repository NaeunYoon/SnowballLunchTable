import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:temp/pages/normal/first.dart';
import 'package:temp/pages/simple/simple_state_manage_page.dart';


class Home extends StatelessWidget {
  const Home
({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text("라우트 관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: 
              (
                  //일반적인 방식
                //   (){
                //   Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_)=>const FirstPage()));
                // }

                  //getX 기본 방식
                (){
                  Get.to(const FirstPage());
                }
              ), child: const Text("일반적인 라우트"),
            ),

            ElevatedButton(onPressed: 
              (
                (){
                  //일반적인 방식
                  //Navigator.of(context).pushNamed("/first");

                  //named 방식
                  Get.toNamed("/first");
                }
              ), child: const Text("Named 라우트"),
            ),
             ElevatedButton(onPressed: 
              (
                (){
                  //일반적인 방식
                  //Navigator.of(context).pushNamed("/first");

                  //named 방식
                  //Get.to(const FirstPage(),arguments: "naeun");
                  Get.toNamed("/next",
                  arguments: User(name: "name", age: 1), 
                  );
                }
              ), child: const Text("Argument 라우트",),
            ),
             ElevatedButton(onPressed: 
              (
                (){
                  Get.toNamed("/user/12345?name=babo&age=3",);
                }
              ), child: const Text("동적 url 전달",),
            ),
            ElevatedButton(onPressed: 
              (
                (){
                  Get.to(const SimpleStateManagePage());
                }
              ), child: const Text("단순상태관리",),
            ),
          ],
        ),
      ),
    );
  }
}


class User
{
  final String name;
  final int age;

  User({required this.name, required this.age});

}