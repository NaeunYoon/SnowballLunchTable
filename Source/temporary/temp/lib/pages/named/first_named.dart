import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/normal/second.dart';
import 'package:temp/src/home_screen.dart';

class FirstNamedPage extends StatelessWidget {
  const FirstNamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstNamedPage"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: 
            (
              (){

              //Navigator.of(context).pushAndRemoveUntil(newRoute, predicate)

               Get.toNamed("/second");
              }
            ), child: const Text("다음페이지"))
          ],
        ),
      ),
    );
  }
}