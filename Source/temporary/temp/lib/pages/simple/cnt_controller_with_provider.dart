import 'package:flutter/material.dart';

class CntControllerWithProvider extends ChangeNotifier 
{
  int cnt = 0;

  void increase()
  {
    cnt++;
    notifyListeners();
  }
}