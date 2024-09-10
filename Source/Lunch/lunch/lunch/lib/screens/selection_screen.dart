import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(132, 187, 69, 1),
                          width: 3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const MenuChoice(menu: "한식",),
                IconButton(onPressed: (){}, icon: const Icon(Icons.font_download)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.font_download)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.font_download)),
              ],
            ),
            const SizedBox(height: 30,),
          DataTable(
            columns:  const [
              DataColumn(label: Text('상호명')),
              DataColumn(label: Text('음식명')),
              DataColumn(label: Text('가격')),
              DataColumn(label: Text('점수')),
              DataColumn(label: Text('기타')),
            ],
            rows: const [
              DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text("")),
                      DataCell(Text('25')),
                      DataCell(Text('Engineering')),
                      DataCell(Text('Engineering')),
                    ],)
              ],
            ),
          ]
        ),
      ),
    );
  }
}

class MenuChoice extends StatefulWidget 
{
  final String menu;

  const MenuChoice({super.key, required this.menu});



  @override
  State<MenuChoice> createState() => _MenuChoiceState();
}

class _MenuChoiceState extends State<MenuChoice> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, 
                          icon: const Icon(Icons.font_download)),
        Text(widget.menu, 
            style: const TextStyle(fontSize: 30,
                                  fontFamily:'BlackHanSans',
                                  color: Color.fromRGBO(132, 187, 69, 1)),
                                  ),
      ],
    );
  }
}