import 'package:drgoblin/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const APP());
}

class APP extends StatelessWidget {
  const APP({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
    );
  }
}
