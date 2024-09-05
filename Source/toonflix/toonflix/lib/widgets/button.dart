

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget{
 
    final String text;
    final Color bgcolor;
    final Color txtcolor;

  const button({super.key, required this.text, required this.bgcolor, required this.txtcolor});

    //const button({super.key, required this.text, required this.bgcolor, required this.txtcolor});
  
  @override
  Widget build(BuildContext context) 
  {
    return Container(
                        decoration: BoxDecoration(color: bgcolor,
                                                      borderRadius: BorderRadius.circular(25)),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          child: Text(text,
                                    style: TextStyle(fontSize: 20,
                                    color: txtcolor,
                                    fontWeight: FontWeight.w300),),
                        ) 
                      );
  }
}