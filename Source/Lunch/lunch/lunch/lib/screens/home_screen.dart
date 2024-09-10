import 'package:flutter/material.dart';
import 'package:lunch/icon/snow_flake_icons.dart';
import 'package:lunch/screens/selection_screen.dart';


enum ActName{
  Home,
  Selection,
  Random,
  Worldcup,
  None

}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{

  ActName selectedPage = ActName.Selection;

  Widget buildPage() {
    if (selectedPage == ActName.Home) {
      return MainPage(); // 메인 페이지
    } else if (selectedPage == ActName.Selection) {
      return const Selection();
    } else if (selectedPage == ActName.Random) {
      return const Center(child: Text('페이지 2', style: TextStyle(fontSize: 30)));
    } else if(selectedPage == ActName.Worldcup) {
      return const Center(child: Text('페이지 3', style: TextStyle(fontSize: 30)));
    }
    return MainPage();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color.fromRGBO(231, 206, 179, 1),
     appBar: AppBar(
      //rgb(219, 187, 159)
      title: 
       const Padding(
         padding: EdgeInsets.symmetric(horizontal: 30),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Image.asset("images/name.png",width: 30,height: 30,),
            SizedBox(width: 20,),
            Text("SNOWBALL LUNCH TABLE",
                    style: TextStyle(fontSize: 30,
                    fontFamily: 'BlackHanSans',
                    fontWeight: FontWeight.w500)
                    ,),
            SizedBox(width: 20,),
            Text("*점메추*",
                    style: TextStyle(fontSize: 30,
                    fontFamily: 'BlackHanSans',
                    //fontWeight: FontWeight.w700,
                    color: Colors.red)
                    ,),
                    ],
            ),
       ),
      backgroundColor: const Color.fromRGBO(219, 187, 159, 1),
     ),
     body: buildPage(),
    );
  }

  Padding MainPage() {
    return Padding(
     padding: const EdgeInsets.all(30),
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const Text("가산 디지털 단지의 맛집 리스트를 모아서",
              style: TextStyle(fontFamily:'BlackHanSans',
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.black ),),
          const Text("Big Data !",
              style: TextStyle(fontFamily:'BlackHanSans',
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                              letterSpacing: 3,
                              )),
        const SizedBox(height: 30,),                    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //rgb(132, 187, 69)
            //rgb(45, 138, 193)
            //rgb(5, 79, 146)
            SnowIcon(name: "Selection",
                      iconColor: const Color.fromRGBO(132, 187, 69, 1),
                      function: (){
                        setState(() {
                          selectedPage = ActName.Selection;
                        });
                      },
                    ),
            SnowIcon(name: "Random",
                      iconColor: const Color.fromRGBO(45, 138, 193, 1),
                      function: (){
                        setState(() {
                          selectedPage = ActName.Random;
                        });
                      },
                    ),
            SnowIcon(name: "Worldcup",
                      iconColor: const Color.fromRGBO(5, 79, 146, 1),
                      function: (){
                        setState(() {
                          selectedPage = ActName.Worldcup;
                        });
                      },
                    ),
          ],
        )
      ],
     ),
   );
  }
}

class SnowIcon extends StatefulWidget 
{
  final Color iconColor;
  final VoidCallback  function;
  final String name;
  const SnowIcon({super.key, 
                  required this.iconColor, 
                  required this.function,
                  required this.name});

  @override
  State<SnowIcon> createState() => _SnowIconState();
}

class _SnowIconState extends State<SnowIcon> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Column(
      children: [
        IconButton(onPressed: widget.function, 
                    icon: Icon(SnowFlake.snowflake,
                     size: 100, color: widget.iconColor,),),
        Text(widget.name.toString(), 
            style: const TextStyle(fontFamily: 'BlackHanSans',
            fontWeight: FontWeight.w300,
            color: Colors.black,
            fontSize: 20),
                            ),
      ],
    );
  }
}