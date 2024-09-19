import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:temp/pages/simple/cnt_controller_with_provider.dart';
import 'package:temp/pages/simple/with_getx.dart';
import 'package:temp/pages/simple/with_provider.dart';
import 'package:temp/src/home_screen.dart';
import 'cnt_controller_with_getX.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({super.key});


  @override
  Widget build(BuildContext context) {
  

//어디서든 선언이 가능함
    Get.put(CntControllerWithGetx());


    return Scaffold(
      appBar: AppBar(
        title: const Text("단순상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Expanded(
              child:  WithGetX(),
              ),
            Expanded(
              child: ChangeNotifierProvider<CntControllerWithProvider>
              (create:(_)=>CntControllerWithProvider(), 
              child:const WithProvider(),),
              ),
          ],
        ),
      ),
    );
  }
}