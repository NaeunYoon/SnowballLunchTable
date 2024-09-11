import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {

  List<DataRow> rowData =[];
   Future<void> loadJson(String fileName) async {
    final String response = await rootBundle.loadString('assets/data/$fileName.json');
    final data = await json.decode(response);
    //print(data);
    
    if(data['restaurants'] != null)
    {
      // List<dynamic> restaurantList = data['restaurants'];
      // print(restaurantList[0].menu);

        List<dynamic> restaurantList = data['restaurants'];
        if (restaurantList.isNotEmpty) 
        {
          //var firstRestaurant = restaurantList[0] as Map<String, dynamic>;
          //print(firstRestaurant['menu']);
        
        setState(() {
          rowData = (data['restaurants'] as List).map((restaurant) 
          {
            var restaurantMap = restaurant as Map<String, dynamic>;
            return DataRow(
              cells: [
                DataCell(Text(restaurantMap['name'])),
                DataCell(Text(restaurantMap['menu'])),
                DataCell(Text(restaurantMap['price'].toString())),
                DataCell(Text(restaurantMap['rating'].toString())),
                DataCell(Text(restaurantMap['location'])),
              ],
            );
          }).toList();
        });
      }
    }else{
        setState(() {
          rowData = [];
        });
    }
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
                MenuChoice(menu: "한식", onClick: () => loadJson("korean")),
                MenuChoice(menu: "중식", onClick: () => loadJson("chiness")),
                MenuChoice(menu: "일식", onClick: () => loadJson("japaness")),
                MenuChoice(menu: "기타", onClick: () => loadJson("other")),
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
            rows: rowData,
            // rows: const [
            //   DataRow(cells: [
            //           DataCell(Text('1')),
            //           DataCell(Text("")),
            //           DataCell(Text('25')),
            //           DataCell(Text('Engineering')),
            //           DataCell(Text('Engineering')),
            //         ],)
            //   ],
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
  final VoidCallback onClick;
  const MenuChoice({super.key, required this.menu, required this.onClick});

  @override
  State<MenuChoice> createState() => _MenuChoiceState();

}

class _MenuChoiceState extends State<MenuChoice> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Row(
        children: [
          IconButton(onPressed: widget.onClick, 
                            icon: const Icon(Icons.font_download,)),
          Text(widget.menu, 
              style: const TextStyle(fontSize: 30,
                                    fontFamily:'BlackHanSans',
                                    color: Color.fromRGBO(132, 187, 69, 1)),
                                    
                                    ),
        ],
      ),
    );
  }
}

