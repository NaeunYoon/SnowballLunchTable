import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/react/dependence_control.dart';

class GetLazyPut extends StatelessWidget {
  const GetLazyPut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(onPressed: ()=>{
        Get.find<DependenceControl>().increase()
      }, child: const Text("data")),
    );
  }
}