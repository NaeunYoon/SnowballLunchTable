import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temp/pages/react/get_lazyput.dart';
import 'get_put.dart';
import 'dependence_control.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("의존성 주입"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Get.to(const GetPut(),
              binding: BindingsBuilder(()
              {
                //사용할 떄 메모리 할당, 사용하지 않으면 메모리 해제
                Get.put(DependenceControl());
              }
              ),
              );
              //바인딩 : 페이지로 보내면서 컨트롤러 주입
              

            }, child: const Text("Get.Put")),
            ElevatedButton(onPressed: (){

               Get.to(GetLazyPut(),
              binding: BindingsBuilder(()
              {
                //인스턴스화 되지 않음(메모리에 올리지 않음)
                //사용할 떄, 컨트롤러에 접근 시 메모리 할당

                Get.lazyPut<DependenceControl>(()=>DependenceControl());
              }
              ),
              );

            }, child: const Text("Get.lazyPut")),
            ElevatedButton(onPressed: (){
             Get.to(GetPut(),
              binding: BindingsBuilder(()
              {
                //비동기 할당
                Get.putAsync<DependenceControl>(() async
                {await Future.delayed(Duration(seconds: 1));
                return DependenceControl();
                });
              }),
              );
            }, child: const Text("Get.putsync")),
            ElevatedButton(onPressed: (){

              Get.to(GetPut(),
              binding: BindingsBuilder(()
              {
                Get.create<DependenceControl>(()=>DependenceControl());
              }
              ),
              );
            }, child: const Text("get.create"))
          ],
        ),
      ),
    );
  }
}