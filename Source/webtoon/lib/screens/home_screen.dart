import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:webtoon/models/webtoonModel.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  
   HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();


  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold
    (
      backgroundColor: Colors.white,
      appBar: AppBar( 
                      backgroundColor: Colors.white30,
                      foregroundColor: Colors.green,
                      elevation: 10,
                      title: const Text("TODAY'S TOONS",
                      style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.w700)
                      ,
                      
                      ),
                    ),
                    body: FutureBuilder(future: webtoons,
                                        builder: (context,snapshot)
                                        {
                                          if(snapshot.hasData) 
                                          {
                                            //return ListView(
                                              // children: [
                                              //   for(var webtoon in snapshot.data!)
                                              //   Text(webtoon.title),
                                              //]

                                              // return ListView.builder(
                                              //     scrollDirection: Axis.horizontal,
                                              //     itemCount: snapshot.data!.length,
                                              //     itemBuilder: (context,index)
                                              //     {
                                              //       var webtoon = snapshot.data![index];
                                              //       return Text(webtoon.title);
                                              //     },
                                              //   );

                                              
                                              // return MakeList(snapshot);
                                              
                                              return Column(
                                                children: [
                                                  const SizedBox(height: 50),
                                                  Expanded(
                                                    child: MakeList(snapshot),
                                                    ),
                                                  
                                                ],
                                              );
                                            
                                          } else
                                          {
                                            return const Center(
                                              child: CircularProgressIndicator(backgroundColor: Colors.green,),
                                            );
                                          }
                                        },),
    );
  }

      ListView MakeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
      return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      itemBuilder: (context,index)
      {
        var webtoon = snapshot.data![index];
        return Webtoon(title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
      separatorBuilder: (context,index)=>
      
        const SizedBox(width: 40,)
      ,
    );
  }


  
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}