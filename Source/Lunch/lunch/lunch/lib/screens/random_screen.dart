import 'dart:async';

import 'package:flutter/material.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {

 final List<String> imagePaths =['assets/foods/food1.jpg',
                                'assets/foods/food2.jpg',
                                'assets/foods/food3.jpg',
                                ];

  late Timer timer;
  int index = 0;
  String img ='';

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
    });
    timer.cancel(); 
  }

    @override
  void dispose() {
    timer.cancel(); 
    Popup();
    super.dispose();
  }

  void Popup()
  {
    showDialog(context: context, 
              builder: (BuildContext context){
                return AlertDialog(
                  title:  Text("선택한 음식은 ?"),
                  content: Image.asset(
                        img,
                        width: 300,
                        height: 300,
                      ),
                       actions: <Widget>[
                      TextButton(
                        child: const Text('닫기'),
                        onPressed: () {
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
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(132, 187, 69, 1),
                          width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Image.asset(imagePaths[index],width: 300,height: 300,),
            const SizedBox(height: 20,),
            IconButton(onPressed: selectImage, 
                       icon: const Icon(Icons.pause_circle_filled),
                      iconSize: 50,),
          
            
          // if(img.isNotEmpty)
          //    Padding(padding: const EdgeInsets.only(top: 20),
          //       child: Column(
          //         children: [
          //           const Text("선택한 음식은 ?"),
          //            Image.asset(
          //               img,
          //               width: 300,
          //               height: 300,
          //             ),
          //         ],
          //       ),
            
          //   ),
          ]
        ),
      ),
    );
  }
}