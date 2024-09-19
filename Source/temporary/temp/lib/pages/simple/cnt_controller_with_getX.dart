import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CntControllerWithGetx extends GetxController 
{
  int cnt =0;
  void increase(String id)
  {
    cnt++;
    update([id]);
  }

  void putNumber(int n)
  {
    cnt = n;
    update();
  }
}