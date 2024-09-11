import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lunch/screens/worldcup_screen.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {

 final List<String> imagePaths =['assets/foods/food1.jpg',
                                'assets/foods/food2.jpg',
                                'assets/foods/food3.jpg',
                                'assets/foods/food4.jpg',
                                'assets/foods/food5.jpg',
                                'assets/foods/food6.jpg',
                                'assets/foods/food7.jpg',
                                'assets/foods/food8.jpg',
                                'assets/foods/food9.jpg',
                                'assets/foods/food10.jpg'
                                ];

  late Timer timer;
  int index = 0;
  String img ='';
  String foodname='';
  @override
  void initState() {
    super.initState();
    changeImg();
  }

 void changeImg() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      setState(() {
        index = (index + 1) % imagePaths.length;
      });
    });
  }

  void selectImage() {
    setState(() {
      img = imagePaths[index];
      foodname = imagePaths[index].toString().split("/").last.split(".").first;
      Popup();
    });
    timer.cancel(); 
  }

    @override
  void dispose() {
    timer.cancel(); 
    super.dispose();
  }

  void Popup()
  {
    showDialog(context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title: CustomFontStyle(txt: "선택한 음식은 ? $foodname",co: const Color.fromRGBO(45, 138, 193, 1),) ,
                  content: Image.asset(
                        img,
                        width: 300,
                        height: 300,
                      ),
                       actions: <Widget>[
                      TextButton(
                        child: const CustomFontStyle(txt: "닫기", co: Color.fromRGBO(45, 138, 193, 1),),
                        onPressed: () {
                          changeImg();
                          Navigator.of(context).pop();
                        },
            ),
          ],
                );
              });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(45, 138, 193, 1),
                          width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePaths[index],width: 300,height: 300,),
            const SizedBox(height: 10,),
            IconButton(onPressed: selectImage, 
                       icon: const Icon(Icons.pause_circle_filled),
                      iconSize: 50,
                      color:const Color.fromRGBO(45, 138, 193, 1) ,),

          ]
        ),
      ),
    );
  }
}