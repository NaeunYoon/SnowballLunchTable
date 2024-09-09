import 'package:flutter/material.dart';
import 'package:lunch/icon/snow_flake_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(231, 206, 179, 1),
     appBar: AppBar(
      //rgb(219, 187, 159)
      title: 
       Row(
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: [
          Image.asset("images/name.png",width: 50,height: 50,),
          const SizedBox(width: 20,),
          const Text("SNOWBALL LUNCH TABLE",
                  style: TextStyle(fontSize: 30,
                  fontFamily: 'BlackHanSans',
                  fontWeight: FontWeight.w500)
                  ,),
          const SizedBox(width: 20,),
          const Text("*점메추*",
                  style: TextStyle(fontSize: 30,
                  fontFamily: 'BlackHanSans',
                  //fontWeight: FontWeight.w700,
                  color: Colors.red)
                  ,),
                  ],
          ),
      backgroundColor: const Color.fromRGBO(219, 187, 159, 1),
     ),
     body:  Column(
      children: [
        Row(
          children: [
            IconButton(onPressed: (){}, icon:  const Icon(SnowFlake.snowflake)),
          ],
        )
      ],
     ),
    );
  }
}