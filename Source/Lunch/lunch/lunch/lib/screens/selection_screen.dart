import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lunch/icon/food_icons.dart';
import 'package:http/http.dart' as http;
import 'package:lunch/screens/worldcup_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {

  List<List<String>> sheetData = [];
  List<DataRow> rowData =[];
  List<String> mapUrl =[];
  Map<String, List<Map<String, dynamic>>> categorizedData = {
    "한식": [],
    "중식": [],
    "일식": [],
    "기타": []
  };


@override
  void initState() {
    super.initState();
    fetchSheetData();
  }

Future<void> fetchSheetData() async {
    const String spreadsheetId = '1xExhGl-o4_lguLUjCta2xDBRrYGy0PB-DFtNxUJsEhk'; 
    const String range = "'가디'!B8:H60";
    const String apiKey = 'AIzaSyAsMcokCxfmaLwIDku0prb233-V4Q1rf3U';
    const String url = 'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<List<String>> data = (jsonResponse['values'] as List)
            .map((row) => (row as List).map((cell) => cell.toString()).toList())
            .toList();

        setState(() {
        sheetData = data;
        categorizeFood();
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

void categorizeFood()
{
  for (var row in sheetData) {
    if (row.length < 6) {
      continue;
    }

    String category = row[0].trim();
    if (category.isEmpty) {
      category = "기타";
    }

    if (categorizedData.containsKey(category)) {
      categorizedData[category]!.add({
        "name": row[1],
        "menu": row[2],
        "price": row[3],
        "rating": row[4],
        "comments": row[5],
        "url":row[6],
      }
      );

    } else {
      categorizedData["기타"]!.add({
        "name": row[1],
        "menu": row[2],
        "price": row[3],
        "rating": row[4],
        "comments": row[5],
        "url":row[6],
      }
      );
    }
    mapUrl.add(row[6]);
  }
  loadSpreadSheet("한식");
}

Future<void> loadSpreadSheet(String fileName) async {
  var foodList = categorizedData[fileName] as List;
  setState(() {
    rowData = foodList.map<DataRow>((food) {
      return DataRow(
        cells: [
          DataCell(GestureDetector(
            onTap: () {
              launchURL(food["url"]);
            },
            child: Text(food["name"] ?? '',
            style: const TextStyle(fontSize: 15,
                            color: Colors.blueAccent),)),), 
          DataCell(Text(food["menu"] ?? '',style: const TextStyle(fontSize: 15),)), 
          DataCell(Text(food["price"] ?? '',style: const TextStyle(fontSize: 15),)), 
          DataCell(Text(food["rating"] ?? '',style: const TextStyle(fontSize: 20,color: Color.fromRGBO(132, 187, 69, 1)),)), 
          DataCell(SingleChildScrollView(
            
            child: Text(food["comments"] ?? '',style: const TextStyle(fontSize: 15),)
              )
            ), 
        ],
      );
    }).toList();
  });
}

 void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView
    (
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(132, 187, 69, 1),
                            width: 3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MenuChoice(menu: "한식", onClick: () => loadSpreadSheet("한식")),
                  MenuChoice(menu: "중식", onClick: () => loadSpreadSheet("중식")),
                  MenuChoice(menu: "일식", onClick: () => loadSpreadSheet("일식")),
                  MenuChoice(menu: "기타", onClick: () => loadSpreadSheet("기타")),
                ],
              ),
              const SizedBox(height: 30,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowMinHeight: 30,
                columns:  const [
                  DataColumn(label: CustomFontStyle(txt: "상호명",co:Color.fromRGBO(132, 187, 69, 1) ,)),
                  DataColumn(label: CustomFontStyle(txt: "음식명",co: Color.fromRGBO(132, 187, 69, 1),)),
                  DataColumn(label: CustomFontStyle(txt: "가격",co: Color.fromRGBO(132, 187, 69, 1),)),
                  DataColumn(label: CustomFontStyle(txt: "점수",co: Color.fromRGBO(132, 187, 69, 1),)),
                  DataColumn(label: CustomFontStyle(txt: "기타",co: Color.fromRGBO(132, 187, 69, 1),)),
                ],
                rows: rowData,
                ),
            ),
            ]
          ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: widget.onClick, 
                        icon: const Icon(Food.food),
                        iconSize: 20,),
          Text(widget.menu, 
              style: const TextStyle(fontSize: 25,
                                    fontFamily:'BlackHanSans',
                                    color: Color.fromRGBO(132, 187, 69, 1)),
                                    
                                    ),
        ],
      ),
    );
  }
}

