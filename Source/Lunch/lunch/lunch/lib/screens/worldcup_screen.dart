import 'package:flutter/material.dart';

class WorldCup extends StatefulWidget {
  const WorldCup({super.key});

  @override
  State<WorldCup> createState() => _WorldCupState();
}

class _WorldCupState extends State<WorldCup> {
  List<String> foodList = [
    "햄버거", "피자", "치킨", "짜장면", "삼겹살", "마라탕", "감자탕", "갈비찜", "곱창전골","생선구이"
  ]; 
  List<String> foodPair = [];
  int round = 0;

  @override
  void initState() {
    super.initState();
    foodPair = foodList.sublist(0, 2);
  }

  void onFoodSelected(String selectedFood) {
    setState(() {
      round += 2;
      foodList.add(selectedFood); 
      if (round >= foodList.length - 1) {
        _showWinnerDialog(foodList.last); 
      } else {
        foodPair = foodList.sublist(round, round + 2);
        foodDialog(foodPair[0], foodPair[1]);
      }
    });
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomFontStyle(txt: "WIN",co: Color.fromRGBO(5, 79, 146, 1),),
          content: Text("$winner WIN"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: const CustomFontStyle(txt: "RETRY",co: Color.fromRGBO(5, 79, 146, 1),),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      round = 0;
      foodList = ["햄버거", "피자", "치킨", "짜장면", "삼겹살", "마라탕", "감자탕", "갈비찜", "곱창전골","생선구이"];
      foodPair = foodList.sublist(0, 2);
      foodDialog(foodPair[0], foodPair[1]); 
    });
  }
  void foodDialog(String name1, String name2) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomFontStyle(txt: "FOOD WORLDCUP",co: Color.fromRGBO(5, 79, 146, 1),),
          content: foodRepeat(name1, name2),
        );
      },
    );
  }

  Widget foodRepeat(String name1, String name2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            onFoodSelected(name1); 
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(5, 79, 146, 1)),
            ),
            child: Center(child: CustomFontStyle(txt: name1, co: const Color.fromRGBO(5, 79, 146, 1))),
          ),
        ),
        const SizedBox(width: 10),
        const CustomFontStyle(txt: "VS", co: Color.fromRGBO(5, 79, 146, 1)),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            onFoodSelected(name2); 
          },
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromRGBO(5, 79, 146, 1)),
            ),
            child: Center(child: CustomFontStyle(txt: name2, co: const Color.fromRGBO(5, 79, 146, 1))),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(5, 79, 146, 1), width: 3)
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              foodDialog(foodPair[0], foodPair[1]); 
            },
            child: const CustomFontStyle(txt: "START",co: Color.fromRGBO(5, 79, 146, 1),),
          ),
        ),
      ),
    );
  }
}

class CustomFontStyle extends StatelessWidget {
  final Color co;
  final String txt;
  const CustomFontStyle({
    super.key,
    required this.txt,
    required this.co,
  });

  @override
  Widget build(BuildContext context) {
    return Text(txt,
            style: TextStyle(color: co,fontSize: 20,
                            fontFamily: 'BlackHanSans',fontWeight: FontWeight.w300),
                            );
  }
}
