import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/simple/cnt_controller_with_getX.dart';
import 'react_cnt_control_with_getX.dart';
class ReactStateManagePage extends StatelessWidget {
  const ReactStateManagePage({super.key});

  @override
  Widget build(BuildContext context) {

//선언부
  Get.put(ReactCntControlWithGetx());

    return Scaffold(
      appBar: AppBar(
        title: const Text("반응형상태관리"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           const Text("GETX"),
           //Get.find<ReactCntControlWithGetx>().cnt.value

            GetX(
            builder: (builder)
            {
              return Text(Get.find<ReactCntControlWithGetx>().cnt.value.toString());
            }
            ),

            //or (어느쪽 써도 상관없음)
            //값이 변할때만 빌드를 함
            
            Obx(()=>
            Text(Get.find<ReactCntControlWithGetx>().cnt.value.toString()
              ),
            ),

          ElevatedButton(
          onPressed: (){
            Get.find<ReactCntControlWithGetx>().increase();
          }, 
          child: const Text("+"),
          ),

          ElevatedButton(
          onPressed: (){
            Get.find<ReactCntControlWithGetx>().putNum(5);
          }, 
          child: const Text("5로 변경"),
        ),

            GetBuilder<CntControllerWithGetx>(
              id: "",
              builder: (control) 
              {
               return Text(control.cnt.toString());
              },
            
            )

          //타입을 지정해서 빌
           
          ],
        ),
      ),
    );
  }
}