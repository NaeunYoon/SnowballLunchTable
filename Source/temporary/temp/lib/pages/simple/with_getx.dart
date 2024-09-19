import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/simple/cnt_controller_with_getX.dart';

class WithGetX extends StatelessWidget {
  WithGetX({super.key});

  //
  CntControllerWithGetx getx = Get.put(CntControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("GETX"),
          
          //타입을 지정해서 빌드
          GetBuilder<CntControllerWithGetx>(
            id: "first",
            builder: (controller)
              {
                return Text(controller.cnt.toString());
              }
          ),
           GetBuilder<CntControllerWithGetx>(
            id: "second",
            builder: (controller)
              {
                return Text(controller.cnt.toString());
              }
          ),

          //const Text("0"),
          _getXBtn("first"),
          _getXBtn("second"),
        ],
      ),
    );
  }

  ElevatedButton _getXBtn(String id) {
    return ElevatedButton(
          onPressed: (){
            Get.find<CntControllerWithGetx>().increase(id);
          }, 
          child: const Text("+"),
        );
  }
}