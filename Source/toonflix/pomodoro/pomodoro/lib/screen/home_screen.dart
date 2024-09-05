import 'dart:async';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  static const int twentyFive = 1500;
  int totalSeconds = twentyFive;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;


  String foramt(int seconds)
  {
    var duration = Duration(seconds:seconds);
    print(duration);
    return seconds.toString();
  }

  void onTick(Timer timer)
  {
    if(totalSeconds ==0)
    {
      setState(() {
        totalPomodoros++;
        totalSeconds = twentyFive;
        isRunning = false;
      });
      //timer.call();
    }else{
      setState(() 
      {
        totalSeconds--;
      }); 

    }
  }

  void onStartPressed()
  {
    timer = Timer.periodic(
      const Duration(seconds: 1), 
      onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed()
  {
   // timer.cancel();
    setState(() {
      isRunning=false;
    });
  }










  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration:  const BoxDecoration(
            ),
              child:  Text(foramt(totalSeconds),
              style: TextStyle(color: Theme.of(context).cardColor,
                                fontSize:98,
                                fontWeight: FontWeight.w600),
          ),
          ),
          ),
           Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 130,
                color: Theme.of(context).cardColor,
                icon: Icon( isRunning ? Icons.pause_circle_outline_rounded : Icons.play_circle_fill_outlined),

                onPressed:isRunning?onPausePressed:onStartPressed,
                ),
            ),
          ),

           Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).cardColor),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text("Pomodoro",
                          style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.headlineLarge!.color,
                          fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(totalPomodoros.toString(), style: TextStyle(
                          fontSize: 50,
                          color: Theme.of(context).textTheme.headlineLarge!.color,
                          fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                ),
              ],
            ),

            ),
        ],
      ),

    );
  }
}