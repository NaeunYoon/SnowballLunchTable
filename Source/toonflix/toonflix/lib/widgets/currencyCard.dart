

import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget{

 final String currencyname;
 final String currencycode;
 final String currencyamount;
 final IconData currencyIcon;


 final bool inverted;

const CurrencyCard({super.key, required this.inverted,required this.currencyname, required this.currencycode, required this.currencyamount, required this.currencyIcon});

  @override
  Widget build(BuildContext context) {
    return  Container(
            clipBehavior: Clip.hardEdge,
            decoration:  BoxDecoration(
              color: inverted ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: 
               Padding(
                padding: const EdgeInsets.all(30),
                child: Row(

                mainAxisAlignment:MainAxisAlignment.spaceBetween ,

                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                     Text(currencyname,
                    style:  TextStyle(
                      color: inverted ? Colors.black : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                         Text(currencyamount,style:  TextStyle(
                          color: inverted ? Colors.black : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),),
                        const SizedBox(width: 5,),
                        Text(currencycode,style: TextStyle(
                          color: inverted ? Colors.black.withOpacity(0.8) : Colors.white.withOpacity(0.8),
                          fontSize: 15,
                          fontWeight: FontWeight.w200,)),
                      ],
                    ),
                  ],
                ),

                Transform.scale(
                  scale: 2.5,
                  child: Transform.translate(
                    offset: const Offset(5,8),
                    child:  Icon(currencyIcon,
                              color: inverted ? Colors.black : Colors.white,
                              size: 80,),
                  ),
                )
                ],
                ),
              ),
          );
  }
}