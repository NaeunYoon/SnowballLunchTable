import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:temp/pages/normal/first.dart';

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

                  //getX방식
                (){
                  Get.to(const FirstPage());
                }
              ), child: const Text("일반적인 라우트"),
            ),

            ElevatedButton(onPressed: 
              (
                (){
                  Get.toNamed("/first");
                }
              ), child: const Text("Named 라우트"),
            ),
          ],
        ),
      ),
    );
  }
}