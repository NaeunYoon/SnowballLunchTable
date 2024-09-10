import 'package:drgoblin/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const APP());
}

class APP extends StatelessWidget {
  const APP({super.key});

  @override
  Widget build(BuildContext context) {
    // 1초 지연 후 전체화면 설정
    Future.delayed(const Duration(seconds: 1), () async {
      if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
        await DesktopWindow.setFullScreen(true);
        await DesktopWindow.setMinWindowSize(const Size(1920, 1080));
        await DesktopWindow.setMaxWindowSize(const Size(3840, 2160));
      }
    });

    return const GetMaterialApp(
      home: Home(),
    );
  }
}

