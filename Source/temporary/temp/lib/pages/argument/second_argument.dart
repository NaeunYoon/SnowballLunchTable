import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/src/home_screen.dart';

class SecondArgument extends StatelessWidget {
  const SecondArgument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondArgument"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(onPressed: 
            (
              (){
                Get.back();
              }
            ), child: const Text("이전 이동")),
            ElevatedButton(onPressed: 
            (
              (){
               Get.offAllNamed("/");
              }
            ), child: const Text("홈 이동"))
          ],
        ),
      ),
    );
  }
}