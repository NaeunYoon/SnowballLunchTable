import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/normal/second.dart';
import 'package:temp/src/home_screen.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstPage"),
      ),
      body:Center(
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
                Get.to(const SecondPage());
              }
            ), child: const Text("다음페이지"))
          ],
        ),
      ),
    );
  }
}