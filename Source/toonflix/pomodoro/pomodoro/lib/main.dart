import 'package:flutter/material.dart';
import 'package:pomodoro/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
    ),
    );
  }
}

class App extends StatelessWidget 
{
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffe7626c),
        textTheme:  const TextTheme(
          headlineLarge: TextStyle(color: Color(0xff232b55)), 
          ),
          cardColor: const Color(0xfff4eddb),
      ),
      home: const HomeScreen(),
    );
  }
}

@override
  Widget build(BuildContext context) {
    return Text("MyLargeTitle",style: TextStyle(color: Theme.of(context).textTheme.titleLarge?.color,
                                          fontSize: 50),);
  }


