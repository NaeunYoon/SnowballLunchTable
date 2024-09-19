import 'package:get/get.dart';


enum Nums{
  first,
  second,
  third
}

class User{
  String name ="";
  int age =9;

  User({required this.age, required this.name});
}


class ReactCntControlWithGetx extends GetxController{
  //q반응형관리 .obs => rxint
  RxInt cnt = 0.obs;
  RxDouble doublerx = 0.0.obs;
  RxString stringrx ="".obs;
  Rx<Nums> numbers = Nums.first.obs;
  Rx<User> user = User(name: "",age: 1).obs;
  RxList<String> list = [""].obs;
  void increase()
  {
    cnt++;
    stringrx(424.toString());
    doublerx(3);
    numbers(Nums.second);

    user.update((user) {
      user!.name ="감자";
      user.age =10;
    });

    list.add("element");
    list.addIf(user.value.name =="감자","감자는 강아지");

  }

  void putNum(int num)
  {
    cnt(num);
  }

  @override
  void onInit() {
    super.onInit();
  //매번 변경될 때 마다 호출
    ever(cnt, (_)=>print({"${cnt} 매번호출"}));
    once(cnt, (_)=>print({"${cnt} 한번만호출"}));
    debounce(cnt, (_)=>print({"${cnt} 마지막 변경에 한번만 호출"}),
    time: Duration(seconds: 1));
    interval(cnt, (_)=>{"${cnt}변경되고 있는 동안에 1초마다 호출"},
    time: Duration(seconds: 1));

  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}