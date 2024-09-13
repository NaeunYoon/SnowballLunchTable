import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:temp/pages/simple/cnt_controller_with_provider.dart';
import 'package:temp/pages/simple/with_getx.dart';
import 'package:temp/pages/simple/with_provider.dart';
import 'package:temp/src/home_screen.dart';

class SimpleStateManagePage extends StatelessWidget {
  const SimpleStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("단순상태관리"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: WithGetX(),
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