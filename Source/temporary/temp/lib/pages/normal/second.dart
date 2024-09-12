import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/src/home_screen.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SecondPage"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             ElevatedButton(onPressed: 
            (
                //일반적인 방식
              //   (){
              //   Navigator.of(context).pop();
              // }

                //getX방식
              (){
                Get.back();
              }
            ), child: const Text("이전 이동")),
            ElevatedButton(onPressed: 
            (
              (){
                //Home으로 돌아가면서 stack에 쌓인 데이터들을 지워줌

                //일반적인 방식
                // Navigator.of(context).
                //   pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Home()), (routh)=>false);
                
                //getX방식
                Get.offAll(const Home());
              }
            ), child: const Text("홈 이동"))
          ],
        ),
      ),
    );
  }
}