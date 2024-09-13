import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/src/home_screen.dart';

class FirstArgument extends StatelessWidget {
  const FirstArgument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FirstArgument"),
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
            ), child: Text((Get.arguments as User).name),),
          ],
        ),
      ),
    );
  }
}