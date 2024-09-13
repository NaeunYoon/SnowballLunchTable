import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/src/home_screen.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserPage"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${Get.parameters["uid"]}님 안녕하세요"
              ),
                          Text(
              "${Get.parameters["name"]}님 안녕하세요"
              ),
                          Text(
              "${Get.parameters["age"]}님 안녕하세요"
              ),
            ElevatedButton(onPressed: 
            (
              (){
              //Navigator.of(context).pushAndRemoveUntil(newRoute, predicate)
               Get.toNamed("/second");
              }
            ), child: Text(
              "${Get.parameters["uid"]}"
              )
            ),
          ],
        ),
      ),
    );
  }
}